/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Cliente
 */
@Entity
@Table(name = "mini")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Mini.findAll", query = "SELECT m FROM Mini m order by m.idmini desc")
    , @NamedQuery(name = "Mini.findByIdmini", query = "SELECT m FROM Mini m WHERE m.idmini = :idmini")
    , @NamedQuery(name = "Mini.findByMindata", query = "SELECT m FROM Mini m WHERE m.mindata = :mindata")
    , @NamedQuery(name = "Mini.findByMinhorario", query = "SELECT m FROM Mini m WHERE m.minhorario = :minhorario")
    , @NamedQuery(name = "Mini.findByMinresponsavel", query = "SELECT m FROM Mini m WHERE m.minresponsavel = :minresponsavel")
    , @NamedQuery(name = "Mini.findFilter", query = "SELECT m FROM Mini m"
    + " WHERE m.minresponsavel like :filtro order by m.idmini desc ")})
public class Mini implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idmini")
    private Integer idmini;
    @Basic(optional = false)
    @Column(name = "mindata")
    @Temporal(TemporalType.DATE)
    private Date mindata;
    @Basic(optional = false)
    @Column(name = "minhorario")
    private String minhorario;
    @Basic(optional = false)
    @Column(name = "minresponsavel")
    private String minresponsavel;

    public Mini() {
    }

    public Mini(Integer idmini) {
        this.idmini = idmini;
    }

    public Mini(Integer idmini, Date mindata, String minhorario, String minresponsavel) {
        this.idmini = idmini;
        this.mindata = mindata;
        this.minhorario = minhorario;
        this.minresponsavel = minresponsavel;
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

    public String getMinresponsavel() {
        return minresponsavel;
    }

    public void setMinresponsavel(String minresponsavel) {
        this.minresponsavel = minresponsavel;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idmini != null ? idmini.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Mini)) {
            return false;
        }
        Mini other = (Mini) object;
        if ((this.idmini == null && other.idmini != null) || (this.idmini != null && !this.idmini.equals(other.idmini))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Mini[ idmini=" + idmini + " ]";
    }
    
}
