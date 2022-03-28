<div id="top"></div>

<h3 align="center">Popover examples on iPhone</h3>

  <p align="center">
    Here you can find 2 examples of "popover" presentation on iPhone
    <br />
    <br />
    <br />
    <a href="https://github.com/github_username/repo_name">View Demo</a>
    ·
  </p>
</div>


<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li>
      <a href="#code">Code</a>
      <ul>
        <li><a href="#step-1#">Step 1</a></li>
      </ul>
    </li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>


## About The Project

The project's idea was born while I was learning how to do a modal view in SwiftUI implementing UIKit. I was simply curious on the popover feature; so I did some research about it.
I discovered that this type of view presentation is available only on iPad for some HIG (Human Interface Guidelines) reason.
I know that we have all follow this simply rules and if there's a rule of what features we can use and where we can use them, we have to follow them.. but it's kind fun to be curious in life, no?


<p align="right">(<a href="#top">back to top</a>)</p>


### Built With

* [SwiftUI](https://developer.apple.com/xcode/swiftui/)

<p align="right">(<a href="#top">back to top</a>)</p>


## Getting Started

Let's start talking about the project now!
First of all, I'm not going to explain every single line of code, but only the ones that are closely related to popover presentation.

### Prerequisites

Before continue I suggest you to learn the working process of NavigationView, List, Toolbar, Ternary Operator, If/Else Operator, @Binding and @State.

<p align="right">(<a href="#top">back to top</a>)</p>


## Usage

This project contains two very different example; they're very different also in the hypothetical usage you could imagine for them.

* 1: The first one is just a variant of view presentation (like in the project the datepicker, but also many others).

* 2: The second one I know that is VERY borderline regarding the HIG, but maybe this type of popover could be usable anyway respecting the HIG.

<p align="right">(<a href="#top">back to top</a>)</p>


## Code

Now let's go deep in the code. First of all, let's create an extension View where we create a certain function..

### Step 1

This is just an example of a viewbuilding, but of course you can do whatever you want of this view. Be creative!

```Ruby
import SwiftUI

//Creating Extension for popover
extension View{
    
    func toolBarPopover<Content: View>(show: Binding<Bool>,placement: Placement = .leading, 
    @ViewBuilder content: @escaping ()->Content)->some View{
        
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                ZStack{
                    if show.wrappedValue{
                        content()
                            .padding()
                            .background(
                                Color.white
                                    .clipShape(Ex1ArrowShape(placement: placement))
                            )
                        
//                        Shadows
                            .shadow(color: Color.primary.opacity(0.05), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.primary.opacity(0.05), radius: 5, x: -5, y: -5)
                            .padding(.horizontal,35)
                        
//                        Moving from top
//                        Approx top Navigation Bar height
                            .offset(y: 55)
                            .offset(x: placement == .leading ? -20 : 20)
                    }
                },
                alignment: placement == .leading ? .topLeading : .topTrailing)
    }
}
```

### Step 2



```Ruby
import SwiftUI

struct MainView1: View {
    
    @State var graphicalDate = false
    @State var showPicker = false
    @State var show = false
     
    var body: some View {
        
        NavigationView{
            
            List{
                
                Toggle(isOn: $showPicker) {
                    
                    Text("Show Picker")
                }
                .toggleStyle(SwitchToggleStyle(tint: .orange))

                
                Toggle(isOn: $graphicalDate) {
                    
                    Text("Show Graphical Date")
                }
                .toggleStyle(SwitchToggleStyle(tint: .orange))
            }
            .navigationTitle("Example 1")
            
//          ToolBar
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button {
                        withAnimation{
                            show.toggle()
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.below.square.fill.and.square")
                            .foregroundColor(.orange)
                    }
                }
            }
        }
        .toolBarPopover(show: $show, placement: .leading){
                        
//            Showing dynamic usage
            if showPicker{
                
                Picker(selection: .constant("")){
                    
                    ForEach(1...10, id: \.self){index in
                        Text ("Example \(index)")
                            .tag(index)
                    }
                    } label: {
                        }
                        .pickerStyle(.wheel)
                        .applyTextColor(.orange)
                        .background(Color(UIColor.systemBackground))

                        
            } else{
                
                if graphicalDate{
                    
//                  Popover View
                    DatePicker("", selection: .constant(Date()))
                    .datePickerStyle(.graphical)
                    .accentColor(.orange)
                    .background(Color(UIColor.systemBackground))

                    
                } else {
                    //              Popover View
                                    DatePicker("", selection: .constant(Date()))
                                    .datePickerStyle(.compact)
                                    .labelsHidden()
                                    .accentColor(.orange)
                                    .background(Color(UIColor.systemBackground))

            }
        }
    }
  }
}
```


<p align="right">(<a href="#top">back to top</a>)</p>


## Contributing

If you have a suggestion that would make this better, please use contacts below.
Don't forget to give the project a star! Thanks again!

<p align="right">(<a href="#top">back to top</a>)</p>


## Contact

###### Discord: Roberto D'Anna@5386
###### Email: roberto.danna97@icloud.com

###### Project Link: [https://github.com/Koryde/Popover-iPhone-examples](https://github.com/Koryde/Popover-iPhone-examples)

<p align="right">(<a href="#top">back to top</a>)</p>
