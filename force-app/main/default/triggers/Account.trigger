/**
 * @author ercarval - topi
 */
trigger Account on Account (before insert, before update, before delete, after insert, after update) {

    new AccountTH().run();
      
}