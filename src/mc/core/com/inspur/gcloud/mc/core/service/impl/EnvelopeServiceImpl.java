package com.inspur.gcloud.mc.core.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inspur.gcloud.mc.core.dao.EnvelopeDao;
import com.inspur.gcloud.mc.core.data.Envelope;
import com.inspur.gcloud.mc.core.service.IEnvelopeService;
import com.lc.gcloud.framework.util.GCloudUtil;

@Service("envelopeService")
public class EnvelopeServiceImpl implements IEnvelopeService {
	
	@Autowired
	private EnvelopeDao envelopeDao;

	@Override
	public List<Envelope> findList(Map parameters) {
		return envelopeDao.findList(parameters);
	}

	@Override
	public List<Envelope> getByParams(Map<String, String> parameters) {
		return envelopeDao.getByParams(parameters);
	}

	@Override
	public Envelope findOne(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int saveEnvelope(Envelope envelope, String messageId) {
		int count = 0;
		if (envelope.getId() != null && !envelope.getId().equals("")) {
            // 更新消息信息
        	count = envelopeDao.update(envelope);
        } else {
            // 保存消息信息
        	envelope.setId(GCloudUtil.getInstance().getNextSeqId(32));
        	envelope.setMessageId(messageId);
        	count = envelopeDao.insert(envelope);
        }
        return count;
	}

	@Override
	public void delete(Map map) {
		// TODO Auto-generated method stub

	}

	@Override
	public int batchSaveEnvelope(List<Envelope> envelopeList, String messageId) {
		List<Envelope> newEnvelopeList = new ArrayList<Envelope>();
		for(int i = 0; i < envelopeList.size(); i++){
			Envelope envelope = envelopeList.get(i);
			envelope.setId(GCloudUtil.getInstance().getNextSeqId(32));
			envelope.setMessageId(messageId);
			newEnvelopeList.add(envelope);
		}
		return envelopeDao.batchInsert(envelopeList);
	}

}
