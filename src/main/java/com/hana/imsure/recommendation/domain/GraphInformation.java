package com.hana.imsure.recommendation.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class GraphInformation {
	
	private String accidentInsurance;
	private String diseaseInsurance;
	private String pensionInsurance;
	private String savingsInsurance;
	private String deadInsurance;
	private String variableInsurance;
	private String medicalInsurance;
	private String nursingInsurance;
	private String condition;
	@Override
	public String toString() {
		return "GraphInformation [accidentInsurance=" + accidentInsurance + ", diseaseInsurance=" + diseaseInsurance
				+ ", pensionInsurance=" + pensionInsurance + ", savingsInsurance=" + savingsInsurance
				+ ", deadInsurance=" + deadInsurance + ", variableInsurance=" + variableInsurance
				+ ", medicalInsurance=" + medicalInsurance + ", nursingInsurance=" + nursingInsurance + ", condition="
				+ condition + "]";
	}
	
	
	
	
	
	

}
