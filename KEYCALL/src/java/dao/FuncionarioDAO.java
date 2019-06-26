/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Funcionario;

/**
 *
 * @author Eduardo Daredevil
 */
public class FuncionarioDAO extends GenericDAO<Funcionario, Integer>{
    public FuncionarioDAO(){
        super(Funcionario.class);
            
    }
    
}
