import SwiftUI

struct TheOneAndOnly: View
{
    @State private var iteration: Int = 0
    @State private var persuasion: Int = 0
    @State private var visibile: Bool = true
    @State private var opacity: Double = 1
    @State private var opacityR: Double = 0
    @State private var index: Int = 0
    @State private var lastConvo: Bool = false
    @State private var reset: Bool = false
    @State private var penny: String = "Penny"
    @State private var boolean: Bool = true
    @State private var opacityV: Double = 0
    private var options: [String] =
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
            let dialogue: [Dialogue] =
            [
                Dialogue(window: CGSize(width: 830, height: 390), name: penny, dialogueText: "Welcome to the third game! To advance to the next level, I'll nedd you to attempt to persuade me to give up the key to the next floor, in spanish. Now let's begin! \n¿Por qué debería darte esta llave?", displayDialogue: $boolean, round: 1, image: penny),
                Dialogue(window: CGSize(width: 830, height: 390), name: penny, dialogueText: "¿Y qué ganas tú con esta llave?", displayDialogue: $boolean, round: 1, image: penny),
                Dialogue(window: CGSize(width: 830, height: 390), name: penny, dialogueText: "¿Y si no quiero darte la llave?", displayDialogue: $boolean, round: 1, image: penny),
                Dialogue(window: CGSize(width: 830, height: 390), name: penny, dialogueText: "I guess it doesn’t hurt me to give you the key.", displayDialogue: $boolean, round: 1, image: penny),
                Dialogue(window: CGSize(width: 830, height: 390), name: penny, dialogueText: "After that performance, I might be doing you a favor by refusing to let you proceed. Try again!", displayDialogue: $boolean, round: 1, image: penny)
            ]
            var width: CGFloat = CGFloat(persuasion * 50)
            
            dialogue[index]
                .offset(y:20)
            
            Capsule()
                .frame(width: 300, height: 20)
                .foregroundStyle(.gray)
                .offset(y:200)
            
            Capsule()
                .frame(width: width, height: 20)
                .foregroundStyle(.red)
                .offset(y:200)
                    
            HStack
            {
                Button(options[0 + 4 * iteration])
                {
                    if persuasion > 1 {penny = "Penny2"}
                    
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
                }
                .frame(width: 350, height: 200)
                .offset(y:-45)
                .disabled(!visibile)
                .opacity(opacity)
                
                Button(options[1 + 4 * iteration])
                {
                    if persuasion > 1 {penny = "Penny2"}
                    
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
                }
                .frame(width: 350, height: 200)
                .offset(y:-45)
                .disabled(!visibile)
                .opacity(opacity)
            }
            .offset(y:100)
            
            HStack
            {
                Button(options[2 + 4 * iteration])
                {
                    if persuasion > 1 {penny = "Penny2"}
                    
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
                }
                .frame(width: 350, height: 200)
                .offset(y:-20)
                .disabled(!visibile)
                .opacity(opacity)
                
                Button(options[3 + 4 * iteration])
                {
                    if persuasion > 1 {penny = "Penny2"}
                    
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
                .opacity(opacityV)
            
            Image("Key")
                .resizable()
                .frame(width: 150, height: 75)
                .offset(y:125)
                .opacity(opacityV)
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

#Preview { TheOneAndOnly() }
