package com.brighten.idi;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.brighten.idi.test.TestMapper;

@SpringBootTest
class IdikoreaApplicationTests {

	@Autowired TestMapper testMapper;
	
    private static final int THREAD_COUNT = 10; // 동시에 실행할 스레드의 수
    private static final int BATCH_SIZE = 50; // 한 번에 처리할 데이터의 양
	//멤버테이블 옮기기,,
//	@Test
//	void contextLoads() {
////				        List<HashMap<String, Object>> list = testMapper.selectOriginMember( 50);
//////				        System.err.println(batchNumber+"asdakjhalfjsldjfklsj");
////				        System.err.println(list);
////				        testMapper.newMemberInsert(list);
//		
////		ExecutorService executorService = Executors.newFixedThreadPool(10);
////		for(int i =0 ; i< 10 ; i++) { 
////			final int batchNumber = i;
////			executorService.submit(new Runnable() {
////				@Override
////				public void run() {
////					try {
////				        System.err.println("실행된거임?"); 
////				        System.err.println(batchNumber);
////				        List<HashMap<String, Object>> list = testMapper.selectOriginMember(batchNumber * 50);
////				        System.err.println(batchNumber+"asdakjhalfjsldjfklsj");
////				        System.err.println(list);
////				        testMapper.newMemberInsert(list);
////				    } catch (Exception e) {
////				        e.printStackTrace(); // 예외 로그를 출력
////				    }
////				}            
////			});
////		}
////		executorService.shutdown();
////		try { 
////		    if (!executorService.awaitTermination(800, TimeUnit.MILLISECONDS)) {
////		        executorService.shutdownNow();
////		    } 
////		} catch (InterruptedException e) {
////		    executorService.shutdownNow();
////		}
//		
//		
//		
//        ExecutorService executorService = Executors.newFixedThreadPool(THREAD_COUNT);
// 
//        // 데이터의 전체 크기를 가져옵니다. 이는 예시이며, 실제로는 데이터베이스에서 이 값을 얻어야 합니다.
//        int totalDataCount = testMapper.originMemberCount();
//        int totalBatches = (totalDataCount + BATCH_SIZE - 1) / BATCH_SIZE;
//
//        for (int i = 0; i < totalBatches; i++) {
//            final int batchNumber = i;
//            executorService.submit(() -> {
//                try {
//                    List<HashMap<String, Object>> list = testMapper.selectOriginMember(batchNumber * BATCH_SIZE);
//                    if (list != null && !list.isEmpty()) {
//                        testMapper.newMemberInsert(list);
//                        System.out.println("Batch " + batchNumber + " processed");
//                    }
//                } catch (Exception e) {
//                    e.printStackTrace(); // 예외 처리
//                }
//            });
//        }
//
//        executorService.shutdown(); // 스레드 풀을 종료하도록 설정
//        try {
//            if (!executorService.awaitTermination(1, TimeUnit.HOURS)) {
//                executorService.shutdownNow(); // 모든 태스크가 종료될 때까지 최대 1시간 대기
//            }
//        } catch (InterruptedException e) {
//            executorService.shutdownNow();
//        }
//	}
    //멤버그룹테이블
//    @Test
//    void contextLoads() {
//    	
//    	List<HashMap<String,Object>> list = testMapper.originGrp();
//    	
//    	for(HashMap<String,Object> map : list) {
//    		testMapper.newGrpInsert(map);
//    	}
//    }

    @Test
    void contextLoads() {
    	
    }
}
 