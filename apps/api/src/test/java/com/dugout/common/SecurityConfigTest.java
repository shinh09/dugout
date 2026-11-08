package com.dugout.common;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.dugout.TestcontainersConfig;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.context.annotation.Import;
import org.springframework.test.web.servlet.MockMvc;

@SpringBootTest
@AutoConfigureMockMvc
@Import(TestcontainersConfig.class)
class SecurityConfigTest {

	@Autowired
	MockMvc mockMvc;

	@Test
	void health는_비로그인도_조회할_수_있다() throws Exception {
		mockMvc.perform(get("/actuator/health")).andExpect(status().isOk());
	}

	@Test
	void openapi_명세는_비로그인도_조회할_수_있다() throws Exception {
		mockMvc.perform(get("/v3/api-docs")).andExpect(status().isOk());
	}

	@Test
	void 허용하지_않은_경로는_비로그인이면_401() throws Exception {
		mockMvc.perform(get("/api/me/broadcasts")).andExpect(status().isUnauthorized());
	}
}
