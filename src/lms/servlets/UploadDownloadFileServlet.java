package lms.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lms.modele.Profil;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class UploadDownloadFileServlet
 */
@WebServlet("/UploadDownloadFileServlet")
public class UploadDownloadFileServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
    private ServletFileUpload uploader = null;
    
    
	@Override
	public void init() throws ServletException{
		DiskFileItemFactory fileFactory = new DiskFileItemFactory();
		File filesDir = (File) getServletContext().getAttribute("FILES_DIR_FILE");
		fileFactory.setRepository(filesDir);
		this.uploader = new ServletFileUpload(fileFactory);
	}
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fileName = request.getParameter("fileName");
	
		if(fileName == null || fileName.equals("")){
			 
			throw new ServletException("File Name can't be null or empty");
			
		}
		
		
		File file = new File(request.getServletContext().getAttribute("FILES_DIR")+File.separator+fileName);
		
		if(!file.exists()){
			throw new ServletException("File doesn't exists on server.");
		}
		
		
		
		
		ServletContext ctx = getServletContext();
		InputStream fis = new FileInputStream(file);
		
		String mimeType = ctx.getMimeType(file.getAbsolutePath());
		
		response.setContentType(mimeType != null? mimeType:"application/octet-stream");
		
		response.setContentLength((int) file.length());
		
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
		
		ServletOutputStream os       = response.getOutputStream();
		
		byte[] bufferData = new byte[1024];
		
		int read=0;
		
		while((read = fis.read(bufferData))!= -1){
			
			os.write(bufferData, 0, read);
		}
		os.flush();
		
		os.close();
		
		fis.close();
		
		
		
	}
    
    
    
    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String folder = request.getParameter("dir");
			String page ="";
    	
    	if(!ServletFileUpload.isMultipartContent(request)){
			throw new ServletException("Content type is not multipart/form-data");
		}
			HttpSession session = request.getSession();
			
		try {
			
			
			 
			List<FileItem> fileItemsList = uploader.parseRequest(request);
			Iterator<FileItem> fileItemsIterator = fileItemsList.iterator();
			while(fileItemsIterator.hasNext()){
				FileItem fileItem = fileItemsIterator.next();

				Profil p = (Profil) session.getAttribute("profil");
				String ref = "espace_client/";
				
				if (folder.equals("doc")) {
					ref +="doc/"+p.getId()+"-"+fileItem.getName();
					page="AjouterDoc";
				}else{
					
					if(folder.equals("photo")){
					ref +="img/"+p.getId()+"-"+fileItem.getName();
					page="ModifierSonProfil";}
					
				}
				 
				session.setAttribute("link_file", ref);
				
				File file = new File("C:/Users/Rosisse/Projet_final_LMS/LMSprojet/WebContent/"+ref);
				fileItem.write(file);
				
				  session.setAttribute("typeAlert", "Info");	 
				  request.getRequestDispatcher(page).forward(request, response);
				
			}
		} catch (FileUploadException e) {
			 session.setAttribute("typeAlert", "Danger");	 
			  request.getRequestDispatcher(page).forward(request, response);
		} catch (Exception e) {
			 session.setAttribute("typeAlert", "Danger");	 
			  request.getRequestDispatcher(page).forward(request, response);
		}
		
	}

}