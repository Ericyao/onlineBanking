package jdbcConnection;

import java.sql.Date;

public  class TimeDeposit {
	private String tusername;
	private String tacctnum;
	private double tbalanceb;
	private double tbalancea;
	private String taccttype;
	private String timeperiod;
	private String tcurrency;
	private String tacctfrom;
	private Date tbegin;
	private Date tdeadline;
	
	
	public String getTusername(){
		return tusername;
	}
	public void setTusername(String tusername){
		this.tusername = tusername;
	}
	
	public String getTacctnum(){
		return tacctnum;
	}
	public void setTacctnum(String tacctnum){
		this.tacctnum = tacctnum;
	}
	
	public double getTbalanceb(){
		return tbalanceb;
	}
	public void setTbalanceb(double tbalanceb){
		this.tbalanceb = tbalanceb;
	}
	
	public String getTaccttype(){
		return taccttype;
	}
	public void setTaccttype(String taccttype){
		this.taccttype = taccttype;
	}
	
	public String getTimeperiod(){
		return timeperiod;
	}
	public void setTimeperiod(String timeperiod){
		this.timeperiod = timeperiod;
	}
	
	public String getTcurrency(){
		return tcurrency;
	}
	public void setTcurrency(String tcurrency){
		this.tcurrency = tcurrency;
	}
	public void setTacctfrom(String tacctfrom){
		this.tacctfrom = tacctfrom;
	}
	public String getTacctfrom(){
		return tacctfrom;
	}
	public double getTbalancea() {
		return tbalancea;
	}
	public void setTbalancea(double tbalancea) {
		this.tbalancea = tbalancea;
	}
	public Date getTbegin() {
		return tbegin;
	}
	public void setTbegin(Date date) {
		this.tbegin = date;
	}
	public Date getTdeadline() {
		return tdeadline;
	}
	public void setTdeadline(Date tdeadline) {
		this.tdeadline = tdeadline;
	}
	
	
}
