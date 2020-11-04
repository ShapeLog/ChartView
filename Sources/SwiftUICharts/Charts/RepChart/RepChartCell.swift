import SwiftUI

public struct RepChartCell: View {
  var value: Double
  var index: Int = 0
  var width: Float
  var numberOfDataPoints: Int
  var gradientColor: ColorGradient
  var touchLocation: CGFloat
  
  var cellWidth: Double {
    return Double(width)/(Double(numberOfDataPoints) * 1.5)
  }
  
  @State var firstDisplay: Bool = true
  
  public init( value: Double,
               index: Int = 0,
               width: Float,
               numberOfDataPoints: Int,
               gradientColor: ColorGradient,
               touchLocation: CGFloat) {
    self.value = value
    self.index = index
    self.width = width
    self.numberOfDataPoints = numberOfDataPoints
    self.gradientColor = gradientColor
    self.touchLocation = touchLocation
  }
  
  public var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 4)
        .fill(gradientColor.linearGradient(from: .bottom, to: .top))
    }
    .frame(width: CGFloat(self.cellWidth))
    .scaleEffect(CGSize(width: 1, height: self.firstDisplay ? 0.0 : self.value), anchor: .center)
    .onAppear {
      self.firstDisplay = false
    }
    .onDisappear {
      self.firstDisplay = true
    }
    .transition(.slide)
    .animation(Animation.spring().delay(self.touchLocation < 0 || !firstDisplay ? Double(self.index) * 0.04 : 0))
  }
}

struct RepChartCell_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      Group {
        RepChartCell(value: 0, width: 50, numberOfDataPoints: 1, gradientColor: ColorGradient.greenRed, touchLocation: CGFloat())
        
        RepChartCell(value: 1, width: 50, numberOfDataPoints: 1, gradientColor: ColorGradient.greenRed, touchLocation: CGFloat())
        RepChartCell(value: 1, width: 50, numberOfDataPoints: 1, gradientColor: ColorGradient.whiteBlack, touchLocation: CGFloat())
        RepChartCell(value: 1, width: 50, numberOfDataPoints: 1, gradientColor: ColorGradient(.purple), touchLocation: CGFloat())
      }
      
      Group {
        RepChartCell(value: 1, width: 50, numberOfDataPoints: 1, gradientColor: ColorGradient.greenRed, touchLocation: CGFloat())
        RepChartCell(value: 1, width: 50, numberOfDataPoints: 1, gradientColor: ColorGradient.whiteBlack, touchLocation: CGFloat())
        RepChartCell(value: 1, width: 50, numberOfDataPoints: 1, gradientColor: ColorGradient(.purple), touchLocation: CGFloat())
      }.environment(\.colorScheme, .dark)
    }
  }
}
