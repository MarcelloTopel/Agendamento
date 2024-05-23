import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Cadastro cd = new Cadastro();
        int opcao;
        do {
            Pessoa pessoa = new Pessoa();
            System.out.println("Escolha uma opção:");
            System.out.println("1. Cadastrar ");
            System.out.println("2. Listar");
            System.out.println("0. Encerrar");

            opcao = sc.nextInt();
            switch (opcao) {
                case 1:
                    System.out.println("Digite o nome da pessoa:");
                    pessoa.setNome(sc.next());
                    System.out.println("Digite a idade da pessoa:");
                    pessoa.setIdade(sc.nextInt());
                    cd.cadastrarPessoa_comBanco(pessoa);
                    break;
                case 2:
                    cd.listar_com_banco();

                    break;
                default:
                    System.out.println("Opção inválida!");
                    break;
            }
        } while (opcao != 0);
    }
}