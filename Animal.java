public class Animal {
    protected int idade;
    protected double peso;
    protected String nome;
    protected String animal;

    public Animal(){

    }

    public Animal(int idade, double peso, String nome) {
        this.idade = idade;
        this.peso = peso;
        this.nome = nome;
        this.animal = animal;
    }

    @Override
    public String toString() {
        return "Animal{" +
                "idade=" + idade +
                ", peso=" + peso +
                ", nome='" + nome + '\'' +
                ", animal='" + animal + '\'' +
                '}';
    }

    public String getAnimal() {
        return animal;
    }

    public void setAnimal(String animal) {
        this.animal = animal;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}