package kr.or.ddit.ioc.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class RangerVo {
		private String userId;
		private String userNm;
		private int listIndex;
		
		@DateTimeFormat(pattern="MM-dd-yyyy")
		private Date brith;
		@DateTimeFormat(pattern="yyyy-MM-dd")
		private Date regDt;
		public Date getRegDt() {
			return regDt;
		}

		public void setRegDt(Date regDt) {
			this.regDt = regDt;
		}

		public RangerVo(){
			
		}
		
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public String getUserNm() {
			return userNm;
		}
		public Date getBrith() {
			return brith;
		}

		public void setBrith(Date brith) {
			this.brith = brith;
		}

		public void setUserNm(String userNm) {
			this.userNm = userNm;
		}
		
		public int getListIndex() {
			return listIndex;
		}

		public void setListIndex(int listIndex) {
			this.listIndex = listIndex;
		}

		@Override
		public String toString() {
			return "RangerVo [userId=" + userId + ", userNm=" + userNm + ", listIndex=" + listIndex + ", brith=" + brith
					+ ", regDt=" + regDt + "]";
		}

	
		

}
