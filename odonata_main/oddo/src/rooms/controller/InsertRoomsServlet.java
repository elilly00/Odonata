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
import rooms.model.vo.sooksoImg;

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
            
            int maxSize = 1024 * 1024 * 10;		// 10Mbyte
            String root = request.getSession().getServletContext().getRealPath("/");	// 웹 서버 컨테이너 경로 추출 : WebContent
            String savePath = root + "thumbnail_uploadFiles/";	// 방금 뽑아낸 루트에 uploadFiles파일 추가함
            
            File f = new File(savePath);
            if (!f.exists()) {	
                f.mkdirs();	
            }
            
            System.out.println(savePath);
            MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
                    new MyFileRenamePolicy());
            
            ArrayList<String> saveFiles = new ArrayList<String>();		// 파일의 바뀐 이름을 저장할 ArrayList
            ArrayList<String> originFiles = new ArrayList<String>();	// 파일의 원래 이름을 젖아할 ArrayList
            
            Enumeration<String> files = multiRequest.getFileNames();	// view에서 보낸 fileNames을 가져옴
            
            while (files.hasMoreElements()) {
                //	System.out.println(files.nextElement());	
                String name = files.nextElement();
                
                if (multiRequest.getFilesystemName(name) != null) {				// 해당 이미지에 대한 rename된 파일명을 가지고 옴	
                    saveFiles.add(multiRequest.getFilesystemName(name));		// 바뀐 이름
                    originFiles.add(multiRequest.getOriginalFileName(name));	// 원래 이름을 가져옴
                }
            }
            
            
            System.out.println(saveFiles);
            System.out.println(originFiles);
            
            String Rooms_Host = multiRequest.getParameter("roomHost");
            String Rooms_Type = multiRequest.getParameter("roomType");
            String[] Rooms_Addr = multiRequest.getParameterValues("roomAddr");
            String Rooms_Price = multiRequest.getParameter("roomPrice");
            String Rooms_Personnel = multiRequest.getParameter("personNum");
            String Rooms_RoomCnt = multiRequest.getParameter("roomCnt");
            String Rooms_ToiletCnt = multiRequest.getParameter("toiletCnt");
            String Rooms_DogAvail = multiRequest.getParameter("pet");
            String[] Amenity = multiRequest.getParameterValues("amenity");
            String Rooms_Desc = multiRequest.getParameter("Desc");
            String Rooms_name = multiRequest.getParameter("roomName");
            
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
            
            Rooms room = new Rooms(0, Rooms_Host, Rooms_Type, strRooms_Addr, Rooms_Price, Rooms_Personnel, 
            						Rooms_RoomCnt, Rooms_ToiletCnt, Rooms_DogAvail, strAmenity, Rooms_Desc, null, strAmenity, 0, Rooms_name);
            // rooms
            
            // 이미지
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
            
            if (result >= 1+ImgList.size()) {
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