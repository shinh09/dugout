package com.dugout.common;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

class GlobalExceptionHandlerTest {

	private final GlobalExceptionHandler handler = new GlobalExceptionHandler();

	@Test
	void 예상하지_못한_예외는_내부_정보_없이_500으로_응답한다() {
		ResponseEntity<ErrorResponse> response =
			handler.handleUnexpected(new IllegalStateException("db password=secret"));

		assertThat(response.getStatusCode()).isEqualTo(HttpStatus.INTERNAL_SERVER_ERROR);
		assertThat(response.getBody().code()).isEqualTo("INTERNAL_ERROR");
		assertThat(response.getBody().message()).doesNotContain("secret");
	}
}
