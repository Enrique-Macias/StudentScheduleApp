//
//  CourseScheduleView.swift
//  app-01
//
//  Created by Enrique Macias on 19/08/24.
//

import SwiftUI

struct CourseScheduleView: View {
    @Environment(\.presentationMode) var presentationMode
    // Días seleccionados
    @State private var selectedDaysArray: [String] = []
    // Hora de inicio y fin del curso
    @State private var startHour = Date()
    @State private var endHour = Date()
    
    // Días de la semana
    let weekDays = ["Mon", "Tue", "Wed", "Thu", "Fri"]
    let dayOrder = ["Mon": 1, "Tue": 2, "Wed": 3, "Thu": 4, "Fri": 5]
    @Binding var selectedDays: String
    @Binding var classHours: String
    
    var body: some View {
        VStack {
            Text("Choose date")
                .font(.title3)
                .bold()
                .padding(.top, 40)
            
            // Días de la semana
            HStack(spacing: 6) {
                ForEach(weekDays, id: \.self) { day in
                    Text(day)
                        .padding()
                        .frame(width: 70, height: 50)
                        .background(selectedDaysArray.contains(day) ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .onTapGesture {
                            if selectedDaysArray.contains(day) {
                                selectedDaysArray.removeAll { $0 == day }
                            } else {
                                selectedDaysArray.append(day)
                            }
                        }
                }
            }
            .padding(.vertical)
            
            // Hora de inicio
            VStack(alignment: .leading) {
                Text("Choose Beginning hour")
                    .font(.subheadline)
                    .padding(.horizontal)
                DatePicker("Start Time", selection: $startHour, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .datePickerStyle(.compact)
                    .frame(maxWidth: .infinity)
            }
            .padding(.vertical)
            
            // Hora de fin
            VStack(alignment: .leading) {
                Text("Choose End hour")
                    .font(.subheadline)
                    .padding(.horizontal)
                DatePicker("End Time", selection: $endHour, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .datePickerStyle(.compact)
                    .frame(maxWidth: .infinity)
            }
            .padding(.vertical)
            
            Spacer()
            
            // Botón Apply
            Button(action: {
                // Formatear la selección de días y horas
                let sortedDays = selectedDaysArray.sorted { dayOrder[$0]! < dayOrder[$1]! }
                let selectedDaysFormatted = sortedDays.joined(separator: ", ")
                let formatter = DateFormatter()
                formatter.dateFormat = "HH:mm"
                let startHourFormatted = formatter.string(from: startHour)
                let endHourFormatted = formatter.string(from: endHour)
                // Actualizar binding
                self.selectedDays = selectedDaysFormatted
                self.classHours = "\(startHourFormatted) - \(endHourFormatted)"
                // Cerrar la vista
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Apply")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            .padding(.bottom, 20)
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}


struct CourseScheduleView_Previews: PreviewProvider {
    @State static var previewSelectedDays = "Day"
    @State static var previewClassHours = "Hour"
    static var previews: some View {
        CourseScheduleView(selectedDays: $previewSelectedDays, classHours: $previewClassHours)
    }
}
