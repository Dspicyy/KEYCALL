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
@Table(name = "ctelefonica")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Ctelefonica.findAll", query = "SELECT c FROM Ctelefonica c order by c.idtel desc")
    , @NamedQuery(name = "Ctelefonica.findByIdtel", query = "SELECT c FROM Ctelefonica c WHERE c.idtel = :idtel")
    , @NamedQuery(name = "Ctelefonica.findByCtsolitante", query = "SELECT c FROM Ctelefonica c WHERE c.ctsolitante = :ctsolitante")
    , @NamedQuery(name = "Ctelefonica.findByCtsetsolicitante", query = "SELECT c FROM Ctelefonica c WHERE c.ctsetsolicitante = :ctsetsolicitante")
    , @NamedQuery(name = "Ctelefonica.findByCtramal", query = "SELECT c FROM Ctelefonica c WHERE c.ctramal = :ctramal")
    , @NamedQuery(name = "Ctelefonica.findByCtnumero", query = "SELECT c FROM Ctelefonica c WHERE c.ctnumero = :ctnumero")
    , @NamedQuery(name = "Ctelefonica.findByCthorario", query = "SELECT c FROM Ctelefonica c WHERE c.cthorario = :cthorario")
    , @NamedQuery(name = "Ctelefonica.findFilter", query = "SELECT c FROM Ctelefonica c"
    + " WHERE UPPER(c.ctsetsolicitante) like :filtro order by c.idtel desc")})
public class Ctelefonica implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idtel")
    private Integer idtel;
    @Basic(optional = false)
    @Column(name = "ctsolitante")
    private String ctsolitante;
    @Basic(optional = false)
    @Column(name = "ctsetsolicitante")
    private String ctsetsolicitante;
    @Basic(optional = false)
    @Column(name = "ctramal")
    private String ctramal;
    @Basic(optional = false)
    @Column(name = "ctnumero")
    private String ctnumero;
    @Basic(optional = false)
    @Column(name = "cthorario")
    private String cthorario;

    public Ctelefonica() {
    }

    public Ctelefonica(Integer idtel) {
        this.idtel = idtel;
    }

    public Ctelefonica(Integer idtel, String ctsolitante, String ctsetsolicitante, String ctramal, String ctnumero, String cthorario) {
        this.idtel = idtel;
        this.ctsolitante = ctsolitante;
        this.ctsetsolicitante = ctsetsolicitante;
        this.ctramal = ctramal;
        this.ctnumero = ctnumero;
        this.cthorario = cthorario;
    }

    public Integer getIdtel() {
        return idtel;
    }

    public void setIdtel(Integer idtel) {
        this.idtel = idtel;
    }

    public String getCtsolitante() {
        return ctsolitante;
    }

    public void setCtsolitante(String ctsolitante) {
        this.ctsolitante = ctsolitante;
    }

    public String getCtsetsolicitante() {
        return ctsetsolicitante;
    }

    public void setCtsetsolicitante(String ctsetsolicitante) {
        this.ctsetsolicitante = ctsetsolicitante;
    }

    public String getCtramal() {
        return ctramal;
    }

    public void setCtramal(String ctramal) {
        this.ctramal = ctramal;
    }

    public String getCtnumero() {
        return ctnumero;
    }

    public void setCtnumero(String ctnumero) {
        this.ctnumero = ctnumero;
    }

    public String getCthorario() {
        return cthorario;
    }

    public void setCthorario(String cthorario) {
        this.cthorario = cthorario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idtel != null ? idtel.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Ctelefonica)) {
            return false;
        }
        Ctelefonica other = (Ctelefonica) object;
        if ((this.idtel == null && other.idtel != null) || (this.idtel != null && !this.idtel.equals(other.idtel))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Ctelefonica[ idtel=" + idtel + " ]";
    }
    
}
