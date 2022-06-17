pragma solidity ^0.8.15;
 
contract estudiante {
    //Declaracion de variables privadas
    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    mapping(string => uint) private _notas_materias; //uint para que solo admita numeros positivos. =< a 100 para que tome valores maximo 100
    uint private _cantidad_materias;
 
    constructor(string memory nombre_, string memory apellido_, string memory curso_){
        _nombre = nombre_;
        _apellido = apellido_;
        _curso = curso_;
        _docente = msg.sender;
    }
 
    function apellido() public view returns (string memory){
        return _apellido;
    }
 
    function nombre_completo() public view returns (string memory){
        return string.concat(_nombre, _apellido);                                   //concatenamos los strings para que devuelva ambos el nombre y el apellido
    }
 
    function curso() public view returns (string memory){
        return _curso;
    }
 
    function set_nota_materia(uint nota, string memory materia) public{
        require(msg.sender == _docente, "Solo esta autorizado el maestro/docente para asignar el valor");
        _notas_materias[materia] = nota;                                            //ponemos el require para que solo un docente pueda establecer las notas
   
    }
 
    function nota_materia(string memory materia) public view returns(uint){
        return _notas_materias[materia];                                            //devuelve la nota de la materia buscandola en el mapping
    }
   
    function aprobo(string memory materia) public view returns(bool aprobado){
        aprobado = false;                                                           //establecemos que por defecto el alumno no apruebe
 
        if (_notas_materias[materia] >= 60){
            aprobado = true;                                                        //si tiene una nota mayor a 6, recibira el aprobado
        }
        return aprobado;                                                            //devuelve true o false dependendo si saco mas de 6 o no
    }
 
    function promedio() public view returns (uint total){
        //total = 0;                                                                //no pudimos resolver el error en esta ultima funcion. Probamos de muchas formas y no la pudimos resolver                                                                             

        //for(uint i = 0; i < _cantidad_materias; i++){
            //total = total + _notas_materias[materia[i]];
        //}
        //total / _cantidad_materias;
        //return total;
    }
 
}
 

