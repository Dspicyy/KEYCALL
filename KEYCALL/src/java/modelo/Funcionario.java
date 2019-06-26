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
@Table(name = "funcionario")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Funcionario.findAll", query = "SELECT f FROM Funcionario f order by f.idfunc desc")
    , @NamedQuery(name = "Funcionario.findByIdfunc", query = "SELECT f FROM Funcionario f WHERE f.idfunc = :idfunc")
    , @NamedQuery(name = "Funcionario.findByFuncnome", query = "SELECT f FROM Funcionario f WHERE f.funcnome = :funcnome")
    , @NamedQuery(name = "Funcionario.findByFunccargo", query = "SELECT f FROM Funcionario f WHERE f.funccargo = :funccargo")
    , @NamedQuery(name = "Funcionario.findFilter", query = "SELECT f FROM Funcionario f"
    + " WHERE UPPER(f.funcnome) like :filtro order by f.idfunc desc")})    
public class Funcionario implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idfunc")
    private Integer idfunc;
    @Basic(optional = false)
    @Column(name = "funcnome")
    private String funcnome;
    @Basic(optional = false)
    @Column(name = "funccargo")
    private String funccargo;

    public Funcionario() {
    }

    public Funcionario(Integer idfunc) {
        this.idfunc = idfunc;
    }

    public Funcionario(Integer idfunc, String funcnome, String funccargo) {
        this.idfunc = idfunc;
        this.funcnome = funcnome;
        this.funccargo = funccargo;
    }

    public Integer getIdfunc() {
        return idfunc;
    }

    public void setIdfunc(Integer idfunc) {
        this.idfunc = idfunc;
    }

    public String getFuncnome() {
        return funcnome;
    }

    public void setFuncnome(String funcnome) {
        this.funcnome = funcnome;
    }

    public String getFunccargo() {
        return funccargo;
    }

    public void setFunccargo(String funccargo) {
        this.funccargo = funccargo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idfunc != null ? idfunc.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Funcionario)) {
            return false;
        }
        Funcionario other = (Funcionario) object;
        if ((this.idfunc == null && other.idfunc != null) || (this.idfunc != null && !this.idfunc.equals(other.idfunc))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return funcnome;
    }
    
}
