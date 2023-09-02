#import "detect.typ": detect

#let minititle(it) = box(
            inset : (top: 2pt, bottom: 2pt, x: 5pt),
            text(18pt)[_#it _]
            )
        

#let introduction(title : [Introduction], it) = {
    rect(
        stroke: (left : 1.8pt), 
        fill: blue.lighten(80%),
        inset: (bottom : 10pt, x : 10pt),
        )[
            #minititle(title)
            #it
        ]       
}


#let chapitre(
    title: none, 
    number: none, 
    objectifs: none, 
    body
) = [
    #set page(
        paper: "a4",
        margin: (x : 1.2cm, top: 2.5cm, bottom: 1cm),
        footer: align(center, counter(page).display("1 / 1", both : true)) ,
        header: [
            #set par(leading: 0pt)
            #line(stroke: .5pt, length: 100%)
            #v(-8pt)
            #h(1fr)
            2023-24
            #h(1fr)
            Mme Cercy
            #line(stroke: .5pt, length: 100%, start: (0pt, -0.7em))
            ]
        )
    #set par(justify: true, linebreaks: "optimized")
    #set text(size: 14pt)
    // #show heading.where(level : 1): it => [
    //     #v(1em, weak : true)
    //     #set align(center)
    //     #minititle[#it.supplement #counter(heading).display() #it.body]
    //     ]
    #v(-5.5pt)
    #align(center)[#rect(
        width : 90%, 
        radius: 130pt, 
        fill: gray,
        stroke: 4pt + gray,
        inset: 10pt,
        )[
        #layout(size => align(center)[#rect(
            inset : 18pt, 
            width: 95%*size.width, 
            fill : white, 
            radius: 6pt
            )[
            #set text(size: 26pt )
            *Chapitre #number: #title* 
        
        ]])
    ]]
    #set align(center)

    #columns(2)[
        #assert(type(objectifs) == "array")
        *_#stack(dir: ltr,
            [Objectifs: #h(7pt)],
            list(marker: [-], ..objectifs)
            )
        _*
        
        #colbreak()
        #set align(left)
        #for k in range(6) {
            [Acitivité #k: ]
            [...] * 1
            linebreak()
        }

    
    ]

    #body
]

#chapitre(title: [Titre du chapitre], number: 1, objectifs: ([Réussir], [Devenir fort]))[
    
]