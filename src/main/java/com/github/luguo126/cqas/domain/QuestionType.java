package com.github.luguo126.cqas.domain;

public class QuestionType {

    public String type;
    public double number;
    public double ratio;


	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	public Double getNumber() {
		return number;
	}
	public void setNumber(Double number) {
		this.number = number;
	}

    public void setRatio(double ratio) {
    	this.ratio = ratio;
    }
    public double getRatio() {
    	return ratio;
    }

	@Override
	public String toString() {
		return "QuestionType [type=" + type + ", number=" + number + ", ratio=" + ratio + "]";
	}

}
