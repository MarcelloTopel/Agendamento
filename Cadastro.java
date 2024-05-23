import java.util.ArrayList;
public class Cadastro {
    private PessoaDAO pessoaDAO;
    private AnimalDAO animalDAO;
    public Cadastro() {
        this.pessoaDAO = new PessoaDAO();
        this.animalDAO = new AnimalDAO();
    }
    public void cadastrarPessoa_comBanco(Pessoa p) {
        pessoaDAO.adiciona(p);
        System.out.println("cadastrada com sucesso!");
    }

    public void listar_com_banco() {
        ArrayList<Pessoa> pessoas = pessoaDAO.listarPessoas();
        for (Pessoa p : pessoas) {
            System.out.println("Nome: " + p.getNome() + ", Idade: " +
                    p.getIdade());
        }
    }

    public void cadastrar_Animal(Animal a) {
        animalDAO.adiciona(a);
        System.out.println("Cadastrado com sucesso!");
    }

    public void listar_Animal(){
        ArrayList<Animal> animais = animalDAO.listarAnimais();
        for (Animal a : animais) {
            System.out.println("Nome: " + a.getNome() + ", Idade: " + a.getIdade() + ", Peso: " + a.getPeso());
        }
    }
}

