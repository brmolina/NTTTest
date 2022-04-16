public class Utils {

    public static boolean validaCNPJ(String cNPJInput){
        if(cNPJinput.length() == 14 && cNPJInput != null){
            return true;
        } else {
            return false;
        }
        /*
        Eu havia entendido que "Não é necessário criar rotina de validação" 
        como Validation Rule, depois dessa rotina pronta e funcionando, lendo novamente, 
        percebi que deveria ser algo mais simples e conciso;
        if(String.isEmpty(cNPJInput)){
            return false;
        } 

        cNPJInput = cNPJInput.replace('.' , '').replace('/', '').replace('-', '');

        //System.debug('Decimal.valueOf(cNPJInput)' + Decimal.valueOf(cNPJInput));
        
        if(Decimal.valueOf(cNPJInput) == 0){
            return false;
        } 
        
        String cnpj = cNPJInput;
        
        if(cNPJInput.length() != 14){
            return false;
        } 
        
        String calculoVerificador1 =  '543298765432';
        String calculoVerificador2 = '6543298765432';
        Integer digitoVerificador = 0;
        Integer resultado = 0;
        
        cnpj = cnpj.substring(0, 12);
        
        //primeiro digito verificador
        for(Integer a = 0; a < cnpj.length(); a ++){
            String num1 = String.valueOf(cnpj.substring(a, a + 1));
            String num2 = String.valueOf(calculoVerificador1.substring(a, a + 1));
            Integer num3 = Integer.valueOf(num1) * Integer.valueOf(num2);
            resultado += num3;
        }

        Integer resultadoMod = Math.mod(resultado, 11);
        
        digitoVerificador = (resultadoMod < 2 ? 0 : 11 - resultadoMod);

        cnpj += digitoVerificador;        
        resultado = 0;
        
        //segundo digito verificador
        for(Integer a = 0; a < cnpj.length(); a ++){
            String num1 = String.valueOf(cnpj.substring(a, a + 1));
            String num2 = String.valueOf(calculoVerificador2.substring(a, a + 1));
            Integer num3 = Integer.valueOf(num1) * Integer.valueOf(num2);
            resultado += num3;
        }

        resultadoMod = Math.mod(resultado, 11);
        digitoVerificador = (resultadoMod < 2 ? 0 : 11 - resultadoMod);
        
        cnpj += digitoVerificador;

        System.debug('cNPJInput => '+ cNPJInput);
        System.debug('cnpj => '+ cnpj);
        
        return cNPJInput == cnpj; */
    }

    public static boolean validaCPF(String cPFInput){
        System.debug('cPFInputLength' + cPFInput);
        if(cPFInput.length() == 11 && cPFInput != null){
            return true;
        } else {
            return false;
        }

        /* if(String.isEmpty(cPFInput)){
            return false;
        } 

        cPFInput = cPFInput.replace('.', '').replace('-', '').replace('/', '');
        

        if(Decimal.valueOf(cPFInput) == 0){
            return false;
        } 
        
        String cpf = cPFInput;
        
        if(cPFInput.length() != 11){
            return false;
        } 
            
        cpf = cpf.substring(0, 9);
        String validacao = '98765432';
        Integer digitoVerificador = 0;
        Integer resultado = 0;

        //primeiro digito verificador
        resultado += Integer.valueOf(String.valueOf(cpf.substring(0, 1))) * 10;

        for(Integer a = 1; a < cpf.length(); a ++){
            String num1 = String.valueOf(cpf.substring(a, a + 1));
            String num2 = String.valueOf(validacao.substring(a - 1, a));
            resultado += Integer.valueOf(num1) * Integer.valueOf(num2);
        }

        digitoVerificador = (Math.mod(resultado, 11) < 2 ? 0 : 11 - (Math.mod(resultado, 11)));

        cpf += digitoVerificador;
        resultado = 0;

        //segundo digito verificador
        resultado += Integer.valueOf(String.valueOf(cpf.substring(0, 1))) * 11;
        resultado += Integer.valueOf(String.valueOf(cpf.substring(1, 2))) * 10;

        for(Integer a = 2; a < cpf.length(); a ++){
            String num1 = String.valueOf(cpf.substring(a, a + 1));
            String num2 = String.valueOf(validacao.substring(a - 2, a - 1));
            resultado += Integer.valueOf(num1) * Integer.valueOf(num2);
        }

        digitoVerificador = (Math.mod(resultado, 11) < 2 ? 0 : 11 - (Math.mod(resultado, 11)));

        cpf += digitoVerificador;

        System.debug('cPFInput => '+ cPFInput);
        System.debug('cpf => '+ cpf);

        return cPFInput == cpf; */
    }
}
