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
@Table(name = "chave")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Chave.findAll", query = "SELECT c FROM Chave c order by c.idchave desc")
    , @NamedQuery(name = "Chave.findByIdchave", query = "SELECT c FROM Chave c WHERE c.idchave = :idchave")
    , @NamedQuery(name = "Chave.findByChdataretirada", query = "SELECT c FROM Chave c WHERE c.chdataretirada = :chdataretirada")
    , @NamedQuery(name = "Chave.findByChsala", query = "SELECT c FROM Chave c WHERE c.chsala = :chsala")
    , @NamedQuery(name = "Chave.findByChhorariore", query = "SELECT c FROM Chave c WHERE c.chhorariore = :chhorariore")
    , @NamedQuery(name = "Chave.findByChdataentrada", query = "SELECT c FROM Chave c WHERE c.chdataentrada = :chdataentrada")
    , @NamedQuery(name = "Chave.findByChhorarioen", query = "SELECT c FROM Chave c WHERE c.chhorarioen = :chhorarioen")
    , @NamedQuery(name = "Chave.findByChresponsavelre", query = "SELECT c FROM Chave c WHERE c.chresponsavelre = :chresponsavelre")
    , @NamedQuery(name = "Chave.findByChresponsavel", query = "SELECT c FROM Chave c WHERE c.chresponsavel = :chresponsavel")
    , @NamedQuery(name = "Chave.findFilter", query = "SELECT c FROM Chave c"
    + " WHERE UPPER(c.chsala) like :filtro order by c.idchave desc ")})
public class Chave implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idchave")
    private Integer idchave;
    @Basic(optional = false)
    @Column(name = "chdataretirada")
    @Temporal(TemporalType.DATE)
    private Date chdataretirada;
    @Basic(optional = false)
    @Column(name = "chsala")
    private String chsala;
    @Basic(optional = false)
    @Column(name = "chhorariore")
    private String chhorariore;
    @Basic(optional = false)
    @Column(name = "chdataentrada")
    @Temporal(TemporalType.DATE)
    private Date chdataentrada;
    @Basic(optional = false)
    @Column(name = "chhorarioen")
    private String chhorarioen;
    @Basic(optional = false)
    @Column(name = "chresponsavelre")
    private String chresponsavelre;
    @Basic(optional = false)
    @Column(name = "chresponsavel")
    private String chresponsavel;

    public Chave() {
    }

    public Chave(Integer idchave) {
        this.idchave = idchave;
    }

    public Chave(Integer idchave, Date chdataretirada, String chsala, String chhorariore, Date chdataentrada, String chhorarioen, String chresponsavelre, String chresponsavel) {
        this.idchave = idchave;
        this.chdataretirada = chdataretirada;
        this.chsala = chsala;
        this.chhorariore = chhorariore;
        this.chdataentrada = chdataentrada;
        this.chhorarioen = chhorarioen;
        this.chresponsavelre = chresponsavelre;
        this.chresponsavel = chresponsavel;
    }

    public Integer getIdchave() {
        return idchave;
    }

    public void setIdchave(Integer idchave) {
        this.idchave = idchave;
    }

    public Date getChdataretirada() {
        return chdataretirada;
    }

    public void setChdataretirada(Date chdataretirada) {
        this.chdataretirada = chdataretirada;
    }

    public String getChsala() {
        return chsala;
    }

    public void setChsala(String chsala) {
        this.chsala = chsala;
    }

    public String getChhorariore() {
        return chhorariore;
    }

    public void setChhorariore(String chhorariore) {
        this.chhorariore = chhorariore;
    }

    public Date getChdataentrada() {
        return chdataentrada;
    }

    public void setChdataentrada(Date chdataentrada) {
        this.chdataentrada = chdataentrada;
    }

    public String getChhorarioen() {
        return chhorarioen;
    }

    public void setChhorarioen(String chhorarioen) {
        this.chhorarioen = chhorarioen;
    }

    public String getChresponsavelre() {
        return chresponsavelre;
    }

    public void setChresponsavelre(String chresponsavelre) {
        this.chresponsavelre = chresponsavelre;
    }

    public String getChresponsavel() {
        return chresponsavel;
    }

    public void setChresponsavel(String chresponsavel) {
        this.chresponsavel = chresponsavel;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idchave != null ? idchave.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Chave)) {
            return false;
        }
        Chave other = (Chave) object;
        if ((this.idchave == null && other.idchave != null) || (this.idchave != null && !this.idchave.equals(other.idchave))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Chave[ idchave=" + idchave + " ]";
    }
    
}
