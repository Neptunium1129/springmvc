package com.cjass.etc.cron;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Scheduler {

	@Scheduled(cron = "*/3 * * * * *")
	public void cronTest1() {
		System.out.println("Interval 3 seconds.");
	}

	@Scheduled(cron = "* 1 * * * *")
	public void cronTest2() {
		System.out.println("Every hour 1 minute.");
	}
}
