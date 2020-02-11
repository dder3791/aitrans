package com.web.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.VoiceDao;
import com.web.domain.Voice;
import com.web.service.VoiceService;

@Service("voice")
@Transactional
public class VoiceServiceImpl implements VoiceService {
	@Resource
	private VoiceDao voiceDao;

	@Override
	public void saveVoice(Voice voice) {
		voiceDao.saveVoice(voice);
	}

	 

}
