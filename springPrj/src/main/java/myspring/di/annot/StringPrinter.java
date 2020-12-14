package myspring.di.annot;

import org.springframework.stereotype.Component;

@Component("stringPrinter")
public class StringPrinter implements Printer {
	private StringBuffer buffer = new StringBuffer();

	@Override
	public void printer(String message) {
		buffer.append(message);
	}
	
	public String toString() {
		return buffer.toString();
	}
	
	
}
