package com.ucd.architectures;

public class DefaultStyle implements Style {

	static Style defaultStyle = new SimpleStyle();

	public static Style getDefaultStyle() {

		return defaultStyle;
	}

	public static void setDefaultStyle(Style style) {
		defaultStyle = style;
	}

	@Override
	public void applyStyle() {
		defaultStyle.applyStyle();
	}

}
