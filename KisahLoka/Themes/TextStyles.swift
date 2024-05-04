import SwiftUI

extension Font {
    static var poppinsLargeTitle: Font {
        Font.custom("Poppins-Regular", size: 34, relativeTo: .largeTitle)
    }
    
    static var poppinsTitle1: Font {
        Font.custom("Poppins-Regular", size: 28, relativeTo: .title)
    }
    
    static var poppinsTitle2: Font {
        Font.custom("Poppins-Regular", size: 22, relativeTo: .title2)
    }
    
    static var poppinsTitle3: Font {
        Font.custom("Poppins-Regular", size: 20, relativeTo: .title3)
    }
    
    static var poppinsHeadline: Font {
        Font.custom("Poppins-SemiBold", size: 17, relativeTo: .headline)
    }
    
    static var poppinsBody: Font {
        Font.custom("Poppins-Regular", size: 17, relativeTo: .body)
    }
    
    static var poppinsCallout: Font {
        Font.custom("Poppins-Regular", size: 16, relativeTo: .callout)
    }
    
    static var poppinsSubheadline: Font {
        Font.custom("Poppins-Regular", size: 15, relativeTo: .subheadline)
    }
    
    static var poppinsFootnote: Font {
        Font.custom("Poppins-Regular", size: 13, relativeTo: .footnote)
    }
    
    static var poppinsCaption1: Font {
        Font.custom("Poppins-Regular", size: 12, relativeTo: .caption)
    }
    
    static var poppinsCaption2: Font {
        Font.custom("Poppins-Regular", size: 11, relativeTo: .caption2)
    }
}
