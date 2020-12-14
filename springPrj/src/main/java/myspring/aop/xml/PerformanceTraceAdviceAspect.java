package myspring.aop.xml;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class PerformanceTraceAdviceAspect {
		
		@Pointcut("within(myspring.user.service.*)")
		private void pointcutMethod() {
			
		}
		
		@Around("pointcutMethod()")
		public Object trace(ProceedingJoinPoint joinPoint) throws Throwable{
			String signatureString = joinPoint.getSignature().toShortString();
			System.out.println(signatureString+"시작");
			
			long start = System.currentTimeMillis();
			try {
				Object result = joinPoint.proceed();
				return result;
			} finally {
				long finish = System.currentTimeMillis();
				System.out.println(signatureString+"종료");
				System.out.println(signatureString+"실행시간 : "+(finish-start)+"ms");
			}
			
		}
		@Before("within(myspring.user.service.*)")
		public void before() {
			System.out.println("beforeAdvice()");
		}
		/*
		@Around("within(myspring.user.service.*)")
		public Object trace(ProceedingJoinPoint joinPoint) throws Throwable{
			String signatureString = joinPoint.getSignature().toShortString();
			System.out.println(signatureString+"시작");
			
			long start = System.currentTimeMillis();
			try {
				Object result = joinPoint.proceed();
				return result;
			} finally {
				long finish = System.currentTimeMillis();
				System.out.println(signatureString+"종료");
				System.out.println(signatureString+"실행시간 : "+(finish-start)+"ms");
			}
			
		}*/
}
