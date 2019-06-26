/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Cliente
 */
@Entity
@Table(name = "usuario")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Usuario.findAll", query = "SELECT u FROM Usuario u")
    , @NamedQuery(name = "Usuario.findByIduso", query = "SELECT u FROM Usuario u WHERE u.iduso = :iduso")
    , @NamedQuery(name = "Usuario.findByUsutipo", query = "SELECT u FROM Usuario u WHERE u.usutipo = :usutipo")
    , @NamedQuery(name = "Usuario.findByUsoemail", query = "SELECT u FROM Usuario u WHERE u.usoemail = :usoemail")
    , @NamedQuery(name = "Usuario.findByUsocpf", query = "SELECT u FROM Usuario u WHERE u.usocpf = :usocpf")})
public class Usuario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "iduso")
    private Integer iduso;
    @Basic(optional = false)
    @Column(name = "usutipo")
    private int usutipo;
    @Basic(optional = false)
    @Column(name = "usoemail")
    private String usoemail;
    @Basic(optional = false)
    @Column(name = "usocpf")
    private String usocpf;

    public Usuario() {
    }

    public Usuario(Integer iduso) {
        this.iduso = iduso;
    }

    public Usuario(Integer iduso, int usutipo, String usoemail, String usocpf) {
        this.iduso = iduso;
        this.usutipo = usutipo;
        this.usoemail = usoemail;
        this.usocpf = usocpf;
    }

    public Integer getIduso() {
        return iduso;
    }

    public void setIduso(Integer iduso) {
        this.iduso = iduso;
    }

    public int getUsutipo() {
        return usutipo;
    }

    public void setUsutipo(int usutipo) {
        this.usutipo = usutipo;
    }

    public String getUsoemail() {
        return usoemail;
    }

    public void setUsoemail(String usoemail) {
        this.usoemail = usoemail;
    }

    public String getUsocpf() {
        return usocpf;
    }

    public void setUsocpf(String usocpf) {
        this.usocpf = usocpf;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (iduso != null ? iduso.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Usuario)) {
            return false;
        }
        Usuario other = (Usuario) object;
        if ((this.iduso == null && other.iduso != null) || (this.iduso != null && !this.iduso.equals(other.iduso))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Usuario[ iduso=" + iduso + " ]";
    }
    
}
