package com.jujumarket.shop.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jujumarket.shop.domain.CategoryVO;
import com.jujumarket.shop.domain.ItemCriteria;
import com.jujumarket.shop.domain.ItemPageDTO;
import com.jujumarket.shop.domain.RegisterItemVO;
import com.jujumarket.shop.service.RegisterItemService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.sf.json.JSONArray;

@Controller
@Log4j
@RequestMapping("/shop/*")
@AllArgsConstructor
public class RegisterItemContoller {

	private RegisterItemService service;
	
	@GetMapping("/list")
	public void list(ItemCriteria cri, Model model) {
		log.info("list : " + cri);
		
		model.addAttribute("list", service.getList(cri));
		//model.addAttribute("pageMaker", new ItemPageDTO(cri, 123));
		int total = service.getTotal(cri);
		
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new ItemPageDTO(cri, total));
	}
	
	// �̹����������� Ȯ��
//	private boolean checkImgType(File file) {
//		try {
//			String contentType = Files.probeContentType(file.toPath());
//			return contentType.startsWith("image");
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return false;
//	}
	
	@PostMapping("/register")
	public String register(RegisterItemVO register, MultipartFile[] uploadFile, RedirectAttributes rttr) {
		
		String uploadFolder = "C:\\jje_work\\juju\\src\\main\\webapp\\resources\\upload";
		
		// ���� ����
		File uploadPath = new File(uploadFolder, "idNo");	// �ӽ÷�! �α��� �Ŀ� idNo �������ֱ�
		log.info("upload path : " + uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdir();
		}

		int i = 0;
		for(MultipartFile multi : uploadFile) {
			
			String uploadFilename = multi.getOriginalFilename();
			
			// IE has file path
			uploadFilename = uploadFilename.substring(uploadFilename.lastIndexOf("\\") + 1);
			
			UUID uuid = UUID.randomUUID();
			uploadFilename = uuid.toString() + "_" + uploadFilename;

			try {
				// �̹��� ���� path�� �ø���
				File saveFile = new File(uploadPath, uploadFilename);
				multi.transferTo(saveFile);
				
			} catch (Exception e) {
				log.error(e.getMessage());
			} // end catch
			
			if(i==0) register.setItemImg1(uploadFilename);
			else if(i==1) register.setItemImg2(uploadFilename);
			else if(i==2) register.setItemImg3(uploadFilename);
			else if(i==3) register.setItemImg4(uploadFilename);
			else if(i==4) {
				register.setImgDetail(uploadFilename);
				break;
			}
			i++;
		} // end for

		
		service.register(register);
		rttr.addFlashAttribute("result", register.getItemCode());
		
		return "redirect:/shop/list";
	}
	
//	@GetMapping("/register")
//	public void register() {
//		
//	}
	
	@GetMapping("/register")
	public void register(Model model) {

//		model.addAttribute("category", service.category());
		List<CategoryVO> category = null;
		category = service.category();
		model.addAttribute("category", JSONArray.fromObject(category));
	}
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("itemCode") String itemCode, @ModelAttribute("cri") ItemCriteria cri, Model model) {
		log.info("/get or modify");
		
		model.addAttribute("getCategory", service.getCategory(itemCode));
		model.addAttribute("item", service.get(itemCode));
	}
	
	@PostMapping("/modify")
	public String modify(RegisterItemVO register, MultipartFile[] uploadFile, @ModelAttribute("cri") ItemCriteria cri, RedirectAttributes rttr) {
		log.info("modify : " + register);
		
		String uploadFolder = "C:\\jje_work\\juju\\src\\main\\webapp\\resources\\upload";
		
		// ���� ����
		File uploadPath = new File(uploadFolder, "idNo");	// �ӽ÷�! �α��� �Ŀ� idNo �������ֱ�
		log.info("upload path : " + uploadPath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdir();		// �� �������� �ڽ��� ������ ����
		}

		int i = 0;
		for(MultipartFile multi : uploadFile) {
			
			String uploadFilename = multi.getOriginalFilename();
			
			// IE has file path
			uploadFilename = uploadFilename.substring(uploadFilename.lastIndexOf("\\") + 1);
			
			UUID uuid = UUID.randomUUID();
			uploadFilename = uuid.toString() + "_" + uploadFilename;

			
			try {
				// �̹��� ���� path�� �ø���
				File saveFile = new File(uploadPath, uploadFilename);
				multi.transferTo(saveFile);
				
			} catch (Exception e) {
				log.error(e.getMessage());
			} // end catch
			
			if(i==0) register.setItemImg1(uploadFilename);
			else if(i==1) register.setItemImg2(uploadFilename);
			else if(i==2) register.setItemImg3(uploadFilename);
			else if(i==3) register.setItemImg4(uploadFilename);
			else if(i==4) {
				register.setImgDetail(uploadFilename);
				break;
			}
			i++;
		} // end for
		
		if(service.modify(register)) {
			rttr.addFlashAttribute("result", "success");
		}
		
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
		 
		return "redirect:/shop/list" + cri.getListLink();
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("itemCode") String itemCode, @ModelAttribute("cri") ItemCriteria cri, RedirectAttributes rttr) {
		log.info("remove....." + itemCode);
		
		RegisterItemVO vo = service.get(itemCode);
		
		String filePath = "C:\\jje_work\\juju\\src\\main\\webapp\\resources\\upload\\idNo\\";

		File file = null;
		
		for(int i=0; i<5; i++) {
			if(i == 0) file = new File(filePath + vo.getItemImg1());
			else if(i==1) file = new File(filePath + vo.getItemImg2());
			else if(i==2) file = new File(filePath + vo.getItemImg3());
			else if(i==3) file = new File(filePath + vo.getItemImg4());
			else if(i==4) file = new File(filePath + vo.getImgDetail());
			
			if(file.exists()) {
				if(file.delete()) {
					System.out.println("��������");
				}else {
					System.out.println("��������");
				}
			}else {
				System.out.println("������ �������� ����");
			}
		}
		
		if(service.remove(itemCode)) {
			rttr.addFlashAttribute("result", "success");
		}
		
//		rttr.addAttribute("pageNum", cri.getPageNum());
//		rttr.addAttribute("amount", cri.getAmount());
//		rttr.addAttribute("type", cri.getType());
//		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/shop/list" + cri.getListLink();
	}
	
	@GetMapping("/remove")
	public String remove(@RequestParam("itemCode") String[] itemCode, @ModelAttribute("cri") ItemCriteria cri, RedirectAttributes rttr) {
		
		for(int i=0; i<itemCode.length; i++) {
			//log.info(itemCode[i] + "������ �ڵ� �Ѿ��");
			service.remove(itemCode[i]);
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		

//		String[] arrIdx = itemCode.toString().split(",");
//		
//	  	for (int i=0; i<arrIdx.length; i++) {
//	  		log.info(arrIdx[i] + "���ø� �迭");
//	  		service.remove(arrIdx[i]);
//	  	}
	  	
	  	return "redirect:/shop/list";
	}
	
	@PostMapping("/excelDown")
	public void ExcelDown(HttpServletResponse response){
        log.info("@@@@@@@@@@@@@@@ExcelDown START@@@@@@@@@@@@@@@");
        
        service.getExcelDown(response);
        
        log.info("@@@@@@@@@@@@@@@ExcelDown END@@@@@@@@@@@@@@@");
    }
	
	@GetMapping("/disModify")
	public String disModify(@RequestParam("itemCode") String[] itemCode, @ModelAttribute("cri") ItemCriteria cri, Model model, RedirectAttributes rttr) {
		
		for(int i=0; i<itemCode.length; i++) {
			RegisterItemVO vo = service.get(itemCode[i]);
			
			// �������� ����
			if(vo.getDispStat().equals("������")) {
				vo.setDispStat("��������");
			}else {
				vo.setDispStat("������");
			}
			
			service.modify(vo);
		}
		
		return "redirect:/shop/list";
	}
	
	@GetMapping("/saleModify")
	public String saleModify(@RequestParam("itemCode") String[] itemCode, @ModelAttribute("cri") ItemCriteria cri, Model model, RedirectAttributes rttr) {
		
		for(int i=0; i<itemCode.length; i++) {
			RegisterItemVO vo = service.get(itemCode[i]);

			// �ǸŻ��� ����
			if(vo.getSaleStat().equals("�Ǹ���")) {
				vo.setSaleStat("�Ǹ�����");
			}else {
				log.info(vo.getItemChr() + "2");
				vo.setSaleStat("�Ǹ���");
			}
			service.modify(vo);
		}
		
		return "redirect:/shop/list";
	}
	
	@GetMapping("/soldModify")
	public String soldModify(@RequestParam("itemCode") String[] itemCode, @ModelAttribute("cri") ItemCriteria cri, Model model, RedirectAttributes rttr) {
		
		for(int i=0; i<itemCode.length; i++) {
			RegisterItemVO vo = service.get(itemCode[i]);
			
			vo.setSaleStat("ǰ��");		
			service.modify(vo);
		}
		
		return "redirect:/shop/list";
	}

}