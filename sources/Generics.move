module 0x42::Generics {
    use std::debug;
    use std::vector;

    struct Flexi<T1,T2> has drop{
        x: T1,
        y: vector<T2>,
    }

    fun new_flexi(_x: bool, _y:vector<u8>):Flexi<bool,u8> {
        return Flexi {
            x: _x,
            y: _y,
        }


    }
    fun generic_func<HelloType>(t:HelloType): HelloType{
        return t
    }


    fun new_vector<T>(arg:T): vector<T>{
        let vec = vector::empty<T>();
        vector::push_back(&mut vec, arg);
        vec
    }

   #[test]

    fun test_new_flexi() {
        let y = vector<u8>[10,12,25];
        let flexi = new_flexi(false, y );
        debug::print(&flexi)
    }
    

    #[test] 

    fun test_generic_func() {
        let thing = generic_func(b"a byte String, wild");
        debug::print(&thing);
    }

    #[test]

    fun test_new_vector(){
        let vec = new_vector(true);
        debug::print(&vec)
    }
}