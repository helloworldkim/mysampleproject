package myspring.di.annot;

import org.springframework.stereotype.Component;

@Component("consolePrinter")
public class ConsolePrinter implements Printer {

	@Override
	public void printer(String message) {
		System.out.println(message);

	}

}
