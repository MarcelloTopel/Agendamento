import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
public class AnimalDAO {
    private Connection connection;
    public AnimalDAO() {
        new Conexao();
        this.connection = Conexao.GeraConexao();
    }
    public void adiciona(Animal a) {
        String sql = "INSERT INTO Animal (nome, idade, peso) VALUES(?, ?, ?, ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, a.getNome());
            stmt.setInt(2, a.getIdade());
            stmt.setDouble(3, a.getPeso());
            stmt.setString(4, a.getAnimal());
            stmt.execute();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public ArrayList<Animal> listarAnimais() {
        ArrayList<Animal> animais = new ArrayList<>();
        String sql = "SELECT * FROM Animal";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Animal a = new Animal();
                a.setPeso(rs.getDouble("peso"));
                a.setNome(rs.getString("nome"));
                a.setIdade(rs.getInt("idade"));
                animais.add(a);
            }
            rs.close();
            stmt.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return animais;
    }
}