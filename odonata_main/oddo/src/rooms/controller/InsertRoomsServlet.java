package rooms.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import rooms.model.service.RoomsService;
import rooms.model.vo.Rooms;
import sooksoimg.model.vo.sooksoImg;

/**
 * Servlet implementation class InsertRoomeServlet
 */
@WebServlet("/insert.ro")
public class InsertRoomsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertRoomsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if (ServletFileUpload.isMultipartContent(request)) {
            
            int maxSize = 1024 * 1024 * 10;  // 10Mbyte
            String root = request.getSession().getServletContext().getRealPath("/");
            String savePath = root + "thumbnail_uploadFiles/";
            
            File f = new File(savePath);
            if (!f.exists()) {	
                f.mkdirs();	
            }
            
            System.out.println(savePath);
            MultipartRequest multiRequset = new MultipartRequest(request, savePath, maxSize, "UTF-8",
                    new MyFileRenamePolicy());
            
            ArrayList<String> saveFiles = new ArrayList<String>();		// 파일의 바뀐 이름을 저장할 ArrayList
            ArrayList<String> originFiles = new ArrayList<String>();	// 파일의 원래 이름을 저장할 ArrayList
            
            Enumeration<String> files = multiRequset.getFileNames();
            
            while (files.hasMoreElements()) {
                //	System.out.println(files.nextElement());	
                String name = files.nextElement();
                
                if (multiRequset.getFilesystemName(name) != null) {				
                    saveFiles.add(multiRequset.getFilesystemName(name));		// 바뀐 이름
                    originFiles.add(multiRequset.getOriginalFileName(name));	// 원래 이름
                }
            }

//			System.out.println(request.getParameter("roomType"));
//			System.out.println(request.getParameter("roomAddr"));
//			System.out.println(request.getParameter("roomPrice"));
//			System.out.println(request.getParameter("personNum"));
//			System.out.println(request.getParameter("roomCnt"));
//			System.out.println(request.getParameter("toiletCont"));
//			System.out.println(request.getParameter("pet"));
//			System.out.println(request.getParameter("amenity"));
//			System.out.println(request.getParameter("Desc"));
            
            System.out.println(saveFiles);
            System.out.println(originFiles);
            
            String Rooms_Type = multiRequset.getParameter("roomType");
            String[] Rooms_Addr = multiRequset.getParameterValues("roomAddr");
            String Rooms_Price = multiRequset.getParameter("roomPrice");
            String Rooms_Personnel = multiRequset.getParameter("personNum");
            String Rooms_RoomCnt = multiRequset.getParameter("roomCnt");
            String Rooms_ToiletCnt = multiRequset.getParameter("toiletCont");
            String Rooms_DogAvail = multiRequset.getParameter("pet");
            String[] Amenity = multiRequset.getParameterValues("amenity");
            String Rooms_Desc = multiRequset.getParameter("Desc");
            
            String strRooms_Addr = "";
            if (Rooms_Addr != null) {
                for (int i = 0; i < Rooms_Addr.length; i++) {
                    if (i == 0) {
                        strRooms_Addr += Rooms_Addr[i];
                    } else {
                        strRooms_Addr += " " + Rooms_Addr[i];
                    }
                }
            }
            
            String strAmenity = "";
            if (Amenity != null) {
                for (int j = 0; j < Amenity.length; j++) {
                    if (j == 0) {
                        strAmenity += Amenity[j];
                    } else {
                        strAmenity += " · " + Amenity[j];
                    }
                }
                
            }
            
            Rooms room = new Rooms(0, null, Rooms_Type, strRooms_Addr, Rooms_Price, Rooms_Personnel, Rooms_RoomCnt, 
            					   Rooms_ToiletCnt, Rooms_DogAvail, strAmenity, Rooms_Desc, null, null, 0);
            // rooms
            
            // image
            ArrayList<sooksoImg> ImgList = new ArrayList<sooksoImg>();
            for (int e = originFiles.size() - 1; e >= 0; e--) {
                sooksoImg s = new sooksoImg();
                s.setImage_path(savePath);
                s.setOrigin_name(originFiles.get(e));
                s.setChange_name(saveFiles.get(e));
                
                
                if (e == originFiles.size() - 1) {
                    s.setImage_Level(0);
                } else {
                    s.setImage_Level(1);
                }
                
                ImgList.add(s);
            }
            
            int result = new RoomsService().insertRooms(room, ImgList);
            
            if (result >= 1 + ImgList.size()) {
                response.sendRedirect(request.getContextPath()); 
            } else {
                request.setAttribute("msg", "숙소 등록 실패");
                request.getRequestDispatcher("WEB-INF/view/errorPage.jsp").forward(request, response);
                
                for (int e = 0; e < saveFiles.size(); e++) {
                    File fail = new File(savePath + saveFiles.get(e));
                    fail.delete();
                }
            }
        }
        
    }
    
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }
    
}