/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.zieumtn.system.service.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.zieumtn.common.service.AuthVO;
import egovframework.zieumtn.common.service.CommonService;
import egovframework.zieumtn.common.service.CommonVO;
import egovframework.zieumtn.common.service.impl.CommonDAO;
import egovframework.zieumtn.system.dao.MessageDAO;
import egovframework.zieumtn.system.service.MessageService;
import egovframework.zieumtn.system.vo.CodeVO;
import egovframework.zieumtn.system.vo.MessageVO;
import egovframework.zieumtn.system.vo.ServiceVO;
import net.sf.json.JSONObject;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

/**
 * @Class Name : EgovSampleServiceImpl.java
 * @Description : Sample Business Implement Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 개발프레임웍크 실행환경 개발팀
 * @since 2009. 03.16
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Service("messageService")
public class MessageServiceImpl extends EgovAbstractServiceImpl implements MessageService {

	private static final Logger LOGGER = LoggerFactory.getLogger(MessageServiceImpl.class);

	/** SampleDAO */
	// TODO ibatis 사용
	@Resource(name = "messageDAO")
	private MessageDAO messageDAO;

	@Resource(name = "commonDAO")
	private CommonDAO commonDAO;
	// TODO mybatis 사용
	//  @Resource(name="sampleMapper")
	//	private SampleMapper sampleDAO;


	@Override
	public List<?> selectMessageList(MessageVO vo) throws Exception {
		List<?> rs = messageDAO.selectMessageList(vo);
		return rs;
	}

	@Override
	public int insertMessage(MessageVO vo) throws Exception {
		int rs = messageDAO.insertMessage(vo);
		return rs;
	}

	@Override
	public int updateMessage(MessageVO vo) throws Exception {
		int rs = messageDAO.updateMessage(vo);
		return rs;
	}

//	@Override
//	public int deleteMessage(MessageVO vo) throws Exception {
//		int rs = messageDAO.deleteMessage(vo);
//		return rs;
//	}

	@Override
	public JSONObject getMessageObject() throws Exception {        //기존 메시지 object 메소드 -> authinfo가 없는 loginController에서 사용
		MessageVO msgVO = new MessageVO();

		List<MessageVO> msgList = (List<MessageVO>) selectMessageList(msgVO);

		JSONObject jsonobj = new JSONObject();
		for(int i=0;i<msgList.size();i++) {
			jsonobj.put(msgList.get(i).getMsgId(), msgList.get(i).getMsgCts());
		}
		System.out.println("메세지 리스트: " +msgList);

		return jsonobj;
	}


/*	@Override
	public JSONObject getMessageObject(String coId) throws Exception {
		MessageVO msgVO = new MessageVO();

		List<MessageVO> msgList = (List<MessageVO>) selectMessageList(msgVO);

		System.out.println("메시지 리스트 확인: " + msgList);

		String cdNa= "";
		List<ServiceVO> serviceList = (List<ServiceVO>) commonDAO.selectCdNa(coId);

		System.out.println("serviceList 리스트 확인: " + serviceList);

		for (ServiceVO serviceVO : serviceList) {
		    cdNa = serviceVO.getCdNa();
		}

		System.out.println("서비스 리스트 확인: " + serviceList);

		JSONObject jsonobj = new JSONObject();
		for(int i=0;i<msgList.size();i++) {

			if (cdNa.equals("KR")) {
				jsonobj.put(msgList.get(i).getMsgId(), msgList.get(i).getMsgCts());

			} else if (cdNa.equals("JP")) {
				jsonobj.put(msgList.get(i).getMsgId(), msgList.get(i).getMsgjpCts());

			} else if(cdNa.equals("US")) {
				jsonobj.put(msgList.get(i).getMsgId(), msgList.get(i).getMsgengCts());

			} else {
				System.out.print(">>>>>>>>>>>>>>CoId Null<<<<<<<<<<<<<<<<<<<<<");
				jsonobj.put(msgList.get(i).getMsgId(), msgList.get(i).getMsgCts());
			}
		}

		return jsonobj;
	}
*/
	@Override
	public JSONObject getMessageObjectByUserRegion(String region) throws Exception {
		MessageVO msgVO = new MessageVO();

		List<MessageVO> msgList = (List<MessageVO>) selectMessageList(msgVO);

		System.out.println("메시지 리스트 확인: " + msgList);

		JSONObject jsonobj = new JSONObject();
		for(int i=0;i<msgList.size();i++) {

			if (region.equals("KR")) {
				jsonobj.put(msgList.get(i).getMsgId(), msgList.get(i).getMsgCts());

			} else if (region.equals("JP")) {
				jsonobj.put(msgList.get(i).getMsgId(), msgList.get(i).getMsgjpCts());

			} else if(region.equals("US")) {
				jsonobj.put(msgList.get(i).getMsgId(), msgList.get(i).getMsgengCts());

			} else {
				System.out.print(">>>>>>>>>>>>>>region Null<<<<<<<<<<<<<<<<<<<<<");
				jsonobj.put(msgList.get(i).getMsgId(), msgList.get(i).getMsgCts());
			}
		}

		return jsonobj;
	}
}
