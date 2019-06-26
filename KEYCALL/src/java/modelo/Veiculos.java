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
@Table(name = "veiculos")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Veiculos.findAll", query = "SELECT v FROM Veiculos v order by v.idvei desc")
    , @NamedQuery(name = "Veiculos.findByIdvei", query = "SELECT v FROM Veiculos v WHERE v.idvei = :idvei")
    , @NamedQuery(name = "Veiculos.findByTipovei", query = "SELECT v FROM Veiculos v WHERE v.tipovei = :tipovei")
    , @NamedQuery(name = "Veiculos.findByDatasai", query = "SELECT v FROM Veiculos v WHERE v.datasai = :datasai")
    , @NamedQuery(name = "Veiculos.findByHorariosai", query = "SELECT v FROM Veiculos v WHERE v.horariosai = :horariosai")
    , @NamedQuery(name = "Veiculos.findByVeiculo", query = "SELECT v FROM Veiculos v WHERE v.veiculo = :veiculo")
    , @NamedQuery(name = "Veiculos.findByPlaca", query = "SELECT v FROM Veiculos v WHERE v.placa = :placa")
    , @NamedQuery(name = "Veiculos.findByDestino", query = "SELECT v FROM Veiculos v WHERE v.destino = :destino")
    , @NamedQuery(name = "Veiculos.findByHodometrosai", query = "SELECT v FROM Veiculos v WHERE v.hodometrosai = :hodometrosai")
    , @NamedQuery(name = "Veiculos.findByMotorista", query = "SELECT v FROM Veiculos v WHERE v.motorista = :motorista")
    , @NamedQuery(name = "Veiculos.findByVigilante", query = "SELECT v FROM Veiculos v WHERE v.vigilante = :vigilante")
    , @NamedQuery(name = "Veiculos.findFilter", query = "SELECT v FROM Veiculos v"
    + " WHERE UPPER(v.veiculo) like :filtro order by v.idvei desc ")})    
public class Veiculos implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idvei")
    private Integer idvei;
    @Basic(optional = false)
    @Column(name = "tipovei")
    private String tipovei;
    @Basic(optional = false)
    @Column(name = "datasai")
    @Temporal(TemporalType.DATE)
    private Date datasai;
    @Basic(optional = false)
    @Column(name = "horariosai")
    private String horariosai;
    @Basic(optional = false)
    @Column(name = "veiculo")
    private String veiculo;
    @Basic(optional = false)
    @Column(name = "placa")
    private String placa;
    @Basic(optional = false)
    @Column(name = "destino")
    private String destino;
    @Basic(optional = false)
    @Column(name = "hodometrosai")
    private String hodometrosai;
    @Basic(optional = false)
    @Column(name = "motorista")
    private String motorista;
    @Basic(optional = false)
    @Column(name = "vigilante")
    private String vigilante;

    public Veiculos() {
    }

    public Veiculos(Integer idvei) {
        this.idvei = idvei;
    }

    public Veiculos(Integer idvei, String tipovei, Date datasai, String horariosai, String veiculo, String placa, String destino, String hodometrosai, String motorista, String vigilante) {
        this.idvei = idvei;
        this.tipovei = tipovei;
        this.datasai = datasai;
        this.horariosai = horariosai;
        this.veiculo = veiculo;
        this.placa = placa;
        this.destino = destino;
        this.hodometrosai = hodometrosai;
        this.motorista = motorista;
        this.vigilante = vigilante;
    }

    public Integer getIdvei() {
        return idvei;
    }

    public void setIdvei(Integer idvei) {
        this.idvei = idvei;
    }

    public String getTipovei() {
        return tipovei;
    }

    public void setTipovei(String tipovei) {
        this.tipovei = tipovei;
    }

    public Date getDatasai() {
        return datasai;
    }

    public void setDatasai(Date datasai) {
        this.datasai = datasai;
    }

    public String getHorariosai() {
        return horariosai;
    }

    public void setHorariosai(String horariosai) {
        this.horariosai = horariosai;
    }

    public String getVeiculo() {
        return veiculo;
    }

    public void setVeiculo(String veiculo) {
        this.veiculo = veiculo;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getDestino() {
        return destino;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public String getHodometrosai() {
        return hodometrosai;
    }

    public void setHodometrosai(String hodometrosai) {
        this.hodometrosai = hodometrosai;
    }

    public String getMotorista() {
        return motorista;
    }

    public void setMotorista(String motorista) {
        this.motorista = motorista;
    }

    public String getVigilante() {
        return vigilante;
    }

    public void setVigilante(String vigilante) {
        this.vigilante = vigilante;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idvei != null ? idvei.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Veiculos)) {
            return false;
        }
        Veiculos other = (Veiculos) object;
        if ((this.idvei == null && other.idvei != null) || (this.idvei != null && !this.idvei.equals(other.idvei))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "modelo.Veiculos[ idvei=" + idvei + " ]";
    }
    
}
