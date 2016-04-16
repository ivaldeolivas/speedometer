/*
 Constantes globales
 */
let APAGADO : String = "Apagado"
let VELOCIDAD_BAJA : String = "Velocidad Baja"
let VELOCIDAD_MEDIA : String  = "Velocidad Media"
let VELOCIDAD_ALTA : String = "Velocidad Alta"

/*
 Enum Velocidades
 */
enum Velocidades: Int {
    
    case Apagado = 0
    case VelocidadBaja = 20
    case VelocidadMedia = 50
    case VelocidadAlta = 120
    
    init( velocidadInicial: Velocidades) {
        self = velocidadInicial
    }
    
    init ( velocidadInicial: Int) {
        switch velocidadInicial {
        case 0:
            self = .Apagado
        case 20:
            self = .VelocidadBaja
        case 50:
            self = .VelocidadMedia
        case 120:
            self = .VelocidadAlta
        default:
            self = .Apagado
        }
    }
}


/*
 Clase Auto
 */
class Auto {
    
    var velocidad : Velocidades = Velocidades.Apagado
    
    init () {
        self.velocidad = Velocidades.Apagado;
    }
    
    func cambioDeVelocidad( actual: Int, velocidadEnCadena: String) -> (Int, String) {
        
        let velocidadActual = Velocidades.init(rawValue: actual)
        var velocidadFinal = (intVelocidad: 0, stVelocidad: APAGADO)

        if (velocidadActual == Velocidades.Apagado) {
            velocidadFinal = (Velocidades.VelocidadBaja.rawValue, VELOCIDAD_BAJA)
            
        }
        if (velocidadActual == Velocidades.VelocidadBaja) {
            velocidadFinal = (Velocidades.VelocidadMedia.rawValue, VELOCIDAD_MEDIA)
            
        }
        if (velocidadActual == Velocidades.VelocidadMedia) {
            velocidadFinal = (Velocidades.VelocidadAlta.rawValue, VELOCIDAD_ALTA)
            
        }
        if (velocidadActual == Velocidades.VelocidadAlta) {
            velocidadFinal = (Velocidades.VelocidadMedia.rawValue, VELOCIDAD_MEDIA)
            
        }
        self.velocidad = Velocidades.init(velocidadInicial: velocidadFinal.intVelocidad)
        return velocidadFinal
    }
}

/*
 Inicializacion
 */
let auto = Auto()

for i in 0..<20 {
    print(auto.cambioDeVelocidad(-1, velocidadEnCadena: APAGADO));
    print("Velocidad: \(auto.velocidad)" )
    print(auto.cambioDeVelocidad(Velocidades.Apagado.rawValue, velocidadEnCadena: APAGADO));
    print(auto.cambioDeVelocidad(Velocidades.VelocidadBaja.rawValue, velocidadEnCadena: APAGADO));
    print(auto.cambioDeVelocidad(Velocidades.VelocidadMedia.rawValue, velocidadEnCadena: APAGADO));
    print(auto.cambioDeVelocidad(Velocidades.VelocidadAlta.rawValue, velocidadEnCadena: APAGADO));
}
