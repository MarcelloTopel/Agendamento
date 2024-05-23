public class Pessoa {
    protected int idP;
    protected String nome;
    protected int idade;

    public Pessoa(){

    }

    public Pessoa(int idP, String nome, int idade) {
        this.idP = idP;
        this.nome = nome;
        this.idade = idade;
    }

    @Override
    public String toString() {
        return "Pessoa{" +
                "idP=" + idP +
                ", nome='" + nome + '\'' +
                ", idade=" + idade +
                '}';
    }

    public int getIdP() {
        return idP;
    }

    public void setIdP(int idP) {
        this.idP = idP;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }
}