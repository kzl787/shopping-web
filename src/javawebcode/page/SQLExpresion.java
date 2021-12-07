package jk2.javawebcode.page;

public class SQLExpresion {
    private String name;
    private String operate;
    private String parame;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOperate() {
        return operate;
    }

    public void setOperate(String operate) {
        this.operate = operate;
    }

    public String getParame() {
        return parame;
    }

    public void setParame(String parame) {
        this.parame = parame;
    }
    @Override
    public String toString() {
        return "SQLExpresion{" +
                "name='" + name + '\'' +
                ", operate='" + operate + '\'' +
                ", parame='" + parame + '\'' +
                '}';
    }

    public SQLExpresion(String name, String operate, String parame) {
        this.name = name;
        this.operate = operate;
        this.parame = parame;
    }

}
