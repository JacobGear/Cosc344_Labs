public class EmployeeSalary implements Comparable<EmployeeSalary> {

    private String fname;
    private String lname;
    private Integer salary;

    public EmployeeSalary(String fname, String lname, Integer salary) {
	this.fname = fname;
	this.lname = lname;
	this.salary = salary;
    }

    public String getFname() {
	return fname;
    }

    public String getLname() {
	return lname;
    }

    public Integer getSalary() {
	return salary;
    }

    public void setFname(String fname) {
	this.fname = fname;
    }

    public void setLname(String lname) {
	this.lname = lname;
    }

    public void setSalary(Integer salary) {
	this.salary = salary;
    }

    public void printEmployeeSalary() {
	System.out.println(this.fname + " " + this.lname + " " + this.salary);
    }

    @Override
	public int compareTo(EmployeeSalary o) {
	if(this.getSalary() == o.getSalary()) return 0;
	else if(this.getSalary() > o.getSalary()) return 1;
	else return -1;
    }

}
