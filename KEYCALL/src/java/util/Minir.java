package util;

import dao.Conexao;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import modelo.Mini;
import relatorios.RelatorioGenerico;
import servelets.mini;

@ManagedBean
@ViewScoped
public class Minir {

    private EntityManager em;
    private EntityManagerFactory emf;

      
    public class Mini {

        private Integer idmini;
        private Date mindata;
        private String minhorario;
        private Integer minresponsavel;
        private String funcnome;
        
        
        public Mini(Integer idmini,
                         Date mindata,
                         String minhorario,
                         Integer minresponsavel,
                         String funcnome) 
        {
            this.idmini = idmini;
            this.mindata = mindata;
            this.minhorario = minhorario;
            this.minresponsavel = minresponsavel;
            this.funcnome = funcnome;
      
        }

        public Integer getIdmini() {
            return idmini;
        }

        public void setIdmini(Integer idmini) {
            this.idmini = idmini;
        }

        public Date getMindata() {
            return mindata;
        }

        public void setMindata(Date mindata) {
            this.mindata = mindata;
        }

        public String getMinhorario() {
            return minhorario;
        }

        public void setMinhorario(String minhorario) {
            this.minhorario = minhorario;
        }

        public Integer getMinresponsavel() {
            return minresponsavel;
        }

        public void setMinresponsavel(Integer minresponsavel) {
            this.minresponsavel = minresponsavel;
        }

        public String getFuncnome() {
            return funcnome;
        }

        public void setFuncnome(String funcnome) {
            this.funcnome = funcnome;
        }


       

    @PostConstruct
    public void init() {

    }

    public void gerarRelatorio() throws IOException {

        try {
            emf = Conexao.getConexao();
            em = emf.createEntityManager();
        } catch (Exception ex) {
            Logger.getLogger("Não foi possível realizar a conexão com a unidade de persistência. Verifique a conexão"+ex.getMessage());
        }

        Query query = em.createNativeQuery("select m.matcod,m.matdesc,m.matfabr,"+
                                           "m.matunid,m.matdatacad,m.matsaldo,"+
                                           "t.tipdesc,l.locnome FROM TIPOMATERIAL T, MATERIAL M, LOCAL L "+
                                           "where M.LOCODIGO = L.LOCODIGO AND " +
                                           "M.TIPCODIGO = T.TIPCODIGO");
        
        List<Object[]> lista = query.getResultList();
        
        List<Mini> mini = new ArrayList<>();

        if (lista != null) {
            for (Object[] objectArray : lista) {
                Mini minir
                        = new Mini(
                                (Integer)   objectArray[0],
                                (Date) objectArray[1],
                                (String) objectArray[2],
                                (Integer) objectArray[3],
                                (String)   objectArray[4]
                              );
                mini.add(minir);
            }
        }
        em.close();
        RelatorioGenerico relatorio = new RelatorioGenerico();
        relatorio.Gerar(mini, "mini");

    }

}
}
