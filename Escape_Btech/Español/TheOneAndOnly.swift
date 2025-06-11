import SwiftUI

struct TheOneAndOnly: View
{
    @Binding public var level: Int
    @State var iteration: Int = 0
    @State var persuasion: Int = 0
    @State var visibile: Bool = true
    @State var opacity: Double = 1
    @State var opacityR: Double = 0
    @State var index: Int = 0
    @State var lastConvo: Bool = false
    @State var reset: Bool = false
    @State var penny: String = "PENNY"
    @State var pennyImg: String = "Penny"
    @State var boolean: Bool = true
    @State var opacityV: Double = 0
    
    var dialogue: [Dialogue] =
    [
        /*Dialogue(window: CGSize(width: 830,height: 300), name: "Pablo", dialogueText: "Welcome to the third game! To advance to the next level, I'll nedd you to attempt to persuade me to give up the key to the next floor, in spanish. Now let's begin! \n¿Por qué debería darte esta llave?"),
        Dialogue(window: CGSize(width: 830,height: 300), name: "Pablo", dialogueText: "¿Y qué ganas tú con esta llave?"),
        Dialogue(window: CGSize(width: 830,height: 300), name: "Pablo", dialogueText: "¿Y si no quiero darte la llave?"),
        Dialogue(window: CGSize(width: 830,height: 300), name: "Pablo", dialogueText: "I guess it doesn’t hurt me to give you the key."),
        Dialogue(window: CGSize(width: 830,height: 300), name: "Pablo", dialogueText: "After that performance, I might be doing you a favor by refusing to let you proceed. Try again!")**/
    ]
    var options: [String] =
    [
        "Eres una persona increíble y sé que harás lo correcto. Confío en ti.",
        "Si me das la llave, te lo agradeceré mucho.",
        "Vamos, no seas tan difícil. Dame la llave.",
        "¡Esto es ridículo! Dame la llave ahora mismo.",
        "Me permite avanzar y cumplir mi misión. ¡Serás mi héroe!",
        "Necesito la llave para continuar. ¿Podrías ayudarme?",
        "Deja de hacer preguntas y dame la llave.",
        "Si no me das la llave, me aseguraré de que lo lamentes.",
        "Siempre recordaré tu amabilidad. Sin ti, no puedo seguir adelante.",
        "Por favor, realmente lo necesito. ¿Me ayudarás?",
        "Si no quieres dármela, entonces no me importa.",
        "¡No tienes opción! Dame la llave ahora.",
        "",
        "",
        "",
        ""
    ]
    
    var body: some View
    {
        
        ZStack
        {
           
            Image("sixthfloorFULL")
                .resizable()
                .ignoresSafeArea()
                .frame(width:4511/2,height:1039/2)
            let dialogue: [Dialogue] =
            [
                Dialogue(window: CGSize(width: 830, height: 390), name: penny, dialogueText: "Welcome to the third game! To advance to the next level, I'll nedd you to attempt to persuade me to give up the key to the next floor, in spanish. Now let's begin! \n¿Por qué debería darte esta llave?", displayDialogue: $boolean, round: 1, image: pennyImg),
                Dialogue(window: CGSize(width: 830, height: 390), name: penny, dialogueText: "¿Y qué ganas tú con esta llave?", displayDialogue: $boolean, round: 1, image: pennyImg),
                Dialogue(window: CGSize(width: 830, height: 390), name: penny, dialogueText: "¿Y si no quiero darte la llave?", displayDialogue: $boolean, round: 1, image: pennyImg),
                Dialogue(window: CGSize(width: 830, height: 390), name: penny, dialogueText: "I guess it doesn’t hurt me to give you the key. Click it to proceed!", displayDialogue: $boolean, round: 1, image: pennyImg),
                Dialogue(window: CGSize(width: 830, height: 390), name: penny, dialogueText: "After that performance, I might be doing you a favor by refusing to let you proceed. Try again!", displayDialogue: $boolean, round: 1, image: pennyImg)
            ]
            var width: CGFloat = CGFloat(persuasion * 50)
            
            dialogue[index]
                .offset(y:20)
            
            GeometryReader{geometry in
                Rectangle()
                    .frame(width: 300, height: 20)
                    .foregroundStyle(.gray)
                    .position(x:1125,y:450)
                
                Rectangle()
                    .frame(width: width, height: 20)
                    .foregroundStyle(.red)
                    .position(x:950+width/2,y:450)
                    
            }
            
            
            HStack
            {
                Button
                {
                    if persuasion > 1 {pennyImg = "Penny2"}
                    
                    if lastConvo
                    {
                        iteration += 1
                        if persuasion >= 3
                        {
                            index += 1
                            opacityV = 1
                        }
                        else
                        {
                            index += 2
                            opacityR = 1
                            reset = true
                        }
                    }
                    
                    if iteration < 3
                    {
                        if iteration == 1 {persuasion += 2}
                        else {persuasion += 1}
                        index += 1
                        iteration += 1
                        
                        if iteration == 2 {lastConvo = true}
                    }
                    
                    if iteration == 3
                    {
                        visibile = !visibile
                        opacity = 0
                    }
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 350,height: 30)
                            .foregroundStyle(.black)
                            .opacity(0.7)
                        Text(options[0 + 4 * iteration])
                            .font(Font.custom("dogica", size: 10))
                            .foregroundStyle(.white)
                    }
                }
                .frame(width: 350, height: 200)
                .offset(y:-45)
                .disabled(!visibile)
                .opacity(opacity)
                
                Button
                {
                    if persuasion > 1 {pennyImg = "Penny2"}
                    
                    if lastConvo
                    {
                        iteration += 1
                        if persuasion >= 3
                        {
                            index += 1
                            opacityV = 1
                        }
                        else
                        {
                            index += 2
                            opacityR = 1
                            reset = true
                        }
                    }
                    
                    if iteration == 3
                    {
                        visibile = !visibile
                        opacity = 0
                    }
                    
                    if iteration < 3
                    {
                        if iteration == 1 {persuasion += 1}
                        else {persuasion += 2}
                        index += 1
                        iteration += 1
                        
                        if iteration == 2 {lastConvo = true}
                    }
                } label : {
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 350,height: 30)
                            .foregroundStyle(.black)
                            .opacity(0.7)
                        Text(options[1 + 4 * iteration])
                            .font(Font.custom("dogica", size: 10))
                            .foregroundStyle(.white)
                    }
                }
                .frame(width: 350, height: 200)
                .offset(y:-45)
                .disabled(!visibile)
                .opacity(opacity)
            }
            .offset(y:100)
            
            HStack
            {
                Button
                {
                    if persuasion > 1 {pennyImg = "Penny2"}
                    
                    if lastConvo
                    {
                        iteration += 1
                        if persuasion >= 3
                        {
                            index += 1
                            opacityV = 1
                        }
                        else
                        {
                            index += 2
                            opacityR = 1
                            reset = true
                        }
                    }
                    
                    if iteration < 3
                    {
                        persuasion -= 1
                        index += 1
                        iteration += 1
                        
                        if iteration == 2 {lastConvo = true}
                    }
                    
                    if iteration == 3
                    {
                        visibile = !visibile
                        opacity = 0
                    }
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 350,height: 30)
                            .foregroundStyle(.black)
                            .opacity(0.7)
                        Text(options[2 + 4 * iteration])
                            .font(Font.custom("dogica", size: 10))
                            .foregroundStyle(.white)
                    }
                }
                .frame(width: 350, height: 200)
                .offset(y:-20)
                .disabled(!visibile)
                .opacity(opacity)
                
                Button
                {
                    if persuasion > 1 {pennyImg = "Penny2"}
                    
                    if lastConvo
                    {
                        iteration += 1
                        if persuasion >= 3
                        {
                            index += 1
                            opacityV = 1
                        }
                        else
                        {
                            index += 2
                            opacityR = 1
                            reset = true
                        }
                    }
                    
                    if iteration == 3
                    {
                        visibile = !visibile
                        opacity = 0
                    }
                    
                    if iteration < 3
                    {
                        persuasion -= 2
                        index += 1
                        iteration += 1
                        
                        if iteration == 2 {lastConvo = true}
                    }
                } label : {
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 350,height: 30)
                            .foregroundStyle(.black)
                            .opacity(0.7)
                        Text(options[3 + 4 * iteration])
                            .font(Font.custom("dogica", size: 10))
                            .foregroundStyle(.white)
                    }
                }
                .frame(width: 350, height: 200)
                .offset(y:-20)
                .disabled(!visibile)
                .opacity(opacity)
            }
            .offset(y:150)
            
            Image("Image")
                .resizable()
                .frame(width: 250, height: 100)
                .offset(y:50)
                .opacity(0)
            
            Button(action: {
                level += 1
                print(level)
            }){
                Image("Key")
                    .resizable()
                    .frame(width: 150, height: 75)
                    .opacity(opacityV)
            }.offset(y:100)
            
        }
        
        Button("Reset")
        {
            iteration = 0
            persuasion = 0
            visibile = true
            opacity = 1
            opacityR = 0
            index = 0
            lastConvo = false
            reset = false
            opacityV = 0
        }
        .disabled(!reset)
        .opacity(opacityR)
    }
}

#Preview {
    @Previewable @State var temp = 0
    TheOneAndOnly(level: $temp)
}
