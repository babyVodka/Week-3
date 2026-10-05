import SwiftUI


struct Student: Identifiable {
    let id = UUID()
    var studentID: String
    var name: String
    var gpa: Double
}

struct ContentView: View {

    @State private var students: [Student] = [
        Student(studentID: "S001", name: "An", gpa: 8.5),
        Student(studentID: "S002", name: "Binh", gpa: 9.0),
        Student(studentID: "S003", name: "Chi", gpa: 7.8),
        Student(studentID: "S004", name: "Duy", gpa: 9.2),
        Student(studentID: "S005", name: "Lan", gpa: 8.0)
    ]
    
    @State private var searchText = ""
    @State private var showAddStudent = false

    var filteredStudents: [Student] {
        if searchText.isEmpty {
            return students
        } else {
            return students.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {

                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
                
                ScrollView {
                    
                    VStack(spacing: 16) {

                        Image(systemName: "person.3.fill")
                            .font(.system(size: 45))
                            .foregroundStyle(.blue)
                            .padding(.top, 10)
                
                        Text("Student Manager")
                            .font(.system(size: 27, weight: .bold))
                            .foregroundStyle(.blue)
                        
                        HStack {
                            
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(.secondary)
                            
                            TextField(
                                "Search student by name...",
                                text: $searchText
                            )
                            
                            if !searchText.isEmpty {
                                Button {
                                    searchText = ""
                                } label: {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundStyle(.secondary)
                                }
                            }
                        }
                        .padding(.horizontal, 14)
                        .frame(height: 48)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(
                            color: .black.opacity(0.05),
                            radius: 4,
                            x: 0,
                            y: 2
                        )
                        .padding(.horizontal)
                        
                        VStack(spacing: 0) {
                            
                            ForEach(filteredStudents) { student in
                                
                                NavigationLink {
                                    StudentDetailView(student: student)
                                } label: {
                                    StudentRow(student: student)
                                }
                                .buttonStyle(.plain)
                                
                                if student.id != filteredStudents.last?.id {
                                    Divider()
                                        .padding(.leading, 70)
                                }
                            }
                        }
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .padding(.horizontal)
                        .shadow(
                            color: .black.opacity(0.05),
                            radius: 5,
                            x: 0,
                            y: 2
                        )
                        
                        Button {
                            showAddStudent = true
                        } label: {
                            
                            HStack {
                                
                                Image(systemName: "plus")
                                    .font(.system(size: 18, weight: .bold))
                                
                                Text("Add Student")
                                    .font(.system(size: 17, weight: .semibold))
                            }
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                        .padding(.horizontal)
                        
                        Text("Total students: \(students.count)")
                            .font(.system(size: 15, weight: .medium))
                            .foregroundStyle(.secondary)
                        
                        
                        Spacer(minLength: 20)
                    }
                    .padding(.top, 10)
                }
            }
            .navigationBarHidden(true)
            .sheet(isPresented: $showAddStudent) {
                
                AddStudentView { newStudent in
                    students.append(newStudent)
                }
            }
        }
    }
}


struct StudentRow: View {
    
    let student: Student
    
    var body: some View {
        
        HStack(spacing: 14) {
  
            ZStack {
                
                Circle()
                    .fill(Color.blue.opacity(0.12))
                    .frame(width: 46, height: 46)
                
                Image(systemName: "person.fill")
                    .font(.system(size: 20))
                    .foregroundStyle(.blue)
            }

            VStack(alignment: .leading, spacing: 3) {
                
                Text(student.name)
                    .font(.system(size: 17, weight: .medium))
                    .foregroundStyle(.primary)
                
                Text(String(format: "GPA: %.1f", student.gpa))
                    .font(.system(size: 14))
                    .foregroundStyle(.secondary)
            }
            
            
            Spacer()

            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
    }
}


struct StudentDetailView: View {
    
    let student: Student
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Image(systemName: "person.circle.fill")
                .font(.system(size: 90))
                .foregroundStyle(.blue)
            
            Text(student.name)
                .font(.system(size: 28, weight: .bold))
            
            VStack(spacing: 12) {
                
                HStack {
                    Text("Student ID")
                    Spacer()
                    Text(student.studentID)
                        .foregroundStyle(.secondary)
                }
                
                Divider()
                
                HStack {
                    Text("GPA")
                    Spacer()
                    Text(String(format: "%.1f", student.gpa))
                        .foregroundStyle(.blue)
                        .fontWeight(.bold)
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(.horizontal)
            
            Spacer()
        }
        .padding(.top, 40)
        .navigationTitle("Student Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddStudentView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var studentID = ""
    @State private var name = ""
    @State private var gpa = ""
    
    let onAdd: (Student) -> Void
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                
                Section("Student Information") {
                    
                    TextField("Student ID", text: $studentID)
                    
                    TextField("Name", text: $name)
                    
                    TextField("GPA", text: $gpa)
                        .keyboardType(.decimalPad)
                }
                
                Section {
                    
                    Button {
                        
                        guard !studentID.isEmpty,
                              !name.isEmpty,
                              let gpaValue = Double(gpa),
                              gpaValue >= 0,
                              gpaValue <= 10
                        else {
                            return
                        }
                        
                        let newStudent = Student(
                            studentID: studentID,
                            name: name,
                            gpa: gpaValue
                        )
                        
                        onAdd(newStudent)
                        dismiss()
                        
                    } label: {
                        
                        HStack {
                            Spacer()
                            
                            Text("Add Student")
                                .fontWeight(.semibold)
                            
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Add Student")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
