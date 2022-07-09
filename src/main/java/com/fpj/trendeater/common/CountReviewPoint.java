package com.fpj.trendeater.common;


public class CountReviewPoint {
	public static int[] getCountReviewPoint(int[] countArr, int totalCount) {
		
		
		int[] ratioArr = new int[countArr.length];
//		System.out.println("lwngth ; " + countArr.length);
		
		
		for(int i = 0; i < countArr.length; i++) {
			
			ratioArr[i] = (int)((double)countArr[i] / (double)totalCount * 100);
//			System.out.println(i+"점 비율 = " + ratioArr[i] );
		}
		
		return ratioArr;
		
	}
}
