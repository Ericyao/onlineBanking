package jdbcConnection;

public class HistoryBean {
	private int referenceno;
	private double exchangerate;
	private String fromacct;
	private String toacct;
	private String transtype;
	private double amount;
	private String date;
	
	public int getReferenceNo() {
		return referenceno;
	}
	public void setReferenceNo(int referenceno) {
		this.referenceno = referenceno;
	}

	public double getExchangeRate() {
		return exchangerate;
	}
	public void setExchangeRate(double exchangerate) {
		this.exchangerate = exchangerate;
	}
	public String getFromAcct() {
		return fromacct;
	}
	public void setFromAcct(String fromacct) {
		this.fromacct = fromacct;
	}
	public String getToAcct() {
		return toacct;
	}
	public void setToAcct(String toacct) {
		this.toacct = toacct;
	}
	public String getTransType() {
		return transtype;
	}
	public void setTransType(String transtype) {
		this.transtype = transtype;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
}
