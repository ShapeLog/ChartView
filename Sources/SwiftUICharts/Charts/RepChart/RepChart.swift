import SwiftUI

public struct RepChart: View, ChartBase {
  public var chartData = ChartData()
  
  @EnvironmentObject var data: ChartData
  @EnvironmentObject var style: ChartStyle
  
  public var body: some View {
    RepChartRow(chartData: data, style: style)
  }
  
  public init() {}
}
