/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Usuario;

/**
 *
 * @author Eduardo Daredevil
 */
public class UsuarioDAO extends GenericDAO<Usuario, Integer>{
    public UsuarioDAO(){
        super(Usuario.class);
            
    }
    
}
