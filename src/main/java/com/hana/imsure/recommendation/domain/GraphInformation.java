package com.hana.imsure.recommendation.domain;

public class GraphInformation {
	
	private String disease_insurance;
	private String pension_insurance;
	private String savings_insurance;
	private String dead_insurance;
	private String variable_insurance;
	private String medical_insurance;
	private String nursing_insurance;
	private String condition;
	public GraphInformation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GraphInformation(String disease_insurance, String pension_insurance, String savings_insurance,
			String dead_insurance, String variable_insurance, String medical_insurance, String nursing_insurance,
			String condition) {
		super();
		this.disease_insurance = disease_insurance;
		this.pension_insurance = pension_insurance;
		this.savings_insurance = savings_insurance;
		this.dead_insurance = dead_insurance;
		this.variable_insurance = variable_insurance;
		this.medical_insurance = medical_insurance;
		this.nursing_insurance = nursing_insurance;
		this.condition = condition;
	}
	public String getDisease_insurance() {
		return disease_insurance;
	}
	public void setDisease_insurance(String disease_insurance) {
		this.disease_insurance = disease_insurance;
	}
	public String getPension_insurance() {
		return pension_insurance;
	}
	public void setPension_insurance(String pension_insurance) {
		this.pension_insurance = pension_insurance;
	}
	public String getSavings_insurance() {
		return savings_insurance;
	}
	public void setSavings_insurance(String savings_insurance) {
		this.savings_insurance = savings_insurance;
	}
	public String getDead_insurance() {
		return dead_insurance;
	}
	public void setDead_insurance(String dead_insurance) {
		this.dead_insurance = dead_insurance;
	}
	public String getVariable_insurance() {
		return variable_insurance;
	}
	public void setVariable_insurance(String variable_insurance) {
		this.variable_insurance = variable_insurance;
	}
	public String getMedical_insurance() {
		return medical_insurance;
	}
	public void setMedical_insurance(String medical_insurance) {
		this.medical_insurance = medical_insurance;
	}
	public String getNursing_insurance() {
		return nursing_insurance;
	}
	public void setNursing_insurance(String nursing_insurance) {
		this.nursing_insurance = nursing_insurance;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	@Override
	public String toString() {
		return "GraphInformation [disease_insurance=" + disease_insurance + ", pension_insurance=" + pension_insurance
				+ ", savings_insurance=" + savings_insurance + ", dead_insurance=" + dead_insurance
				+ ", variable_insurance=" + variable_insurance + ", medical_insurance=" + medical_insurance
				+ ", nursing_insurance=" + nursing_insurance + ", condition=" + condition + "]";
	}
	
	
	
	

}
