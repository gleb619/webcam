package org.test.webcam.util.task;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class TasksBatch {

	@Scheduled(cron = "0 0 0 * * ?")
    public void eachMidnight() {
//        LocalDate now = new LocalDate();
//        persistentTokenRepository.findByTokenDateBefore(now.minusMonths(1)).stream().forEach(token ->{
//            log.debug("Deleting token {}", token.getSeries());
//            User user = token.getUser();
//            user.getPersistentTokens().remove(token);
//            persistentTokenRepository.delete(token);
//        });
    }

    @Scheduled(cron = "0 0 1 * * ?")
    public void eachOneHour() {
//        DateTime now = new DateTime();
//        List<User> users = userRepository.findAllByActivatedIsFalseAndCreatedDateBefore(now.minusDays(3));
//        for (User user : users) {
//            log.debug("Deleting not activated user {}", user.getLogin());
//            userRepository.delete(user);
//        }
    }
	
}
