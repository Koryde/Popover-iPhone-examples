<div id="top"></div>

# Popover examples on iPhone

  <p align="center">
  </p>
</div>

<p align="center">
<img width="300" height="650" src ="https://user-images.githubusercontent.com/94546744/161548450-f126b087-b8e7-4c0e-92dc-9266742595bc.gif">
</p>
<p align="center">
	Here you can find 2 examples of "popover" presentation on iPhone
</p>
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
      <a href="#code-example-1">Code example n°1</a>
      <ul>
        <li><a href="#step-1">Step 1</a></li>
        <li><a href="#step-2">Step 2</a></li>
        <li><a href="#step-3">Step 3</a></li>
      </ul>
    </li>
    <li>
      <a href="#code-example-2">Code example n°2</a>
      <ul>
        <li><a href="#step-1">Step 1</a></li>
        <li><a href="#step-2">Step 2</a></li>
      </ul>
    </li>
    <li><a href="#contributing">Contributing</a></li>
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

Before continue I suggest you to learn the working process of NavigationView, Toolbar, Ternary Operator, If/Else Operator, @Binding and @State.

<p align="right">(<a href="#top">back to top</a>)</p>


## Usage

This project contains two very different example; they're very different also in the hypothetical usage you could imagine for them.

* 1: The first one is just a variant of view presentation (like in the project the datepicker, but also many others).

* 2: The second one I know that is VERY borderline regarding the HIG, but maybe this type of popover could be usable anyway respecting the HIG.

<p align="right">(<a href="#top">back to top</a>)</p>


## Code example 1

### Step 1

```Swift
extension View{
		func toolBarPopover<Content: View>(show: Binding<Bool>,placement: Placement = .leading,
                                       @ViewBuilder content: @escaping ()->Content)->some View{
                               self
                                     (...)
                                          if show.wrappedValue{...}
```
Let’s create a viewbuilder function where we create the view’s container we want to present.

### Step 2

```Swift
@State var show = false
NavigationView{
...
}.toolbar{
    ToolbarItem(placement: ."..."){
          Button {
                  withAnimation{
                      show.toggle()
                  }
              } label: {
                  Image(systemName: "...")
                      .foregroundColor(."...")
              }
          }
      }
  }.toolBarPopover(show: $show, placement: ."..."){
```
Here it comes the core part, very important as very easy: just place “.toolBarPopover” at the end of the NavigationView and give the classic present binding (like modal view) to a button

### Step 3

```Swift
struct Ex1ArrowShape: Shape{
  var placement: Placement
  func path(in rect: CGRect) -> Path {
  return Path { path in
  let pt1 = CGPoint(x: 0, y: 0)
  let pt2 = CGPoint(x: rect.width, y: 0)
  let pt3 = CGPoint(x: rect.width, y: rect.height)
  let pt4 = CGPoint(x: 0, y: rect.height)
//  Drawing arcs with radius
  path.move(to: pt4)
  path.addArc(tangent1End: pt1, tangent2End: pt2, radius: 15)
  path.addArc(tangent1End: pt2, tangent2End: pt3, radius: 15)
  path.addArc(tangent1End: pt3, tangent2End: pt4, radius: 15)
  path.addArc(tangent1End: pt4, tangent2End: pt1, radius: 15)
//  Arrow
  path.move(to: pt1)
  path.addLine(to: CGPoint(x: placement == .leading ? 10 : rect.width-10, y: 0))
  path.addLine(to: CGPoint(x: placement == .leading ? 15 : rect.width-15, y: 0))
  path.addLine(to: CGPoint(x: placement == .leading ? 25 : rect.width-25, y: -15))
  path.addLine(to: CGPoint(x: placement == .leading ? 40 : rect.width-40, y: 0))
  }
  }
}
```
This is an example of container very similar to original iPad’s popover.

<p align="right">(<a href="#top">back to top</a>)</p>

## Code example 2

### Step 1

```Swift
@State var show = false
VStack(alignment: ."...", spacing: "..."){
	if self.show{
	   PopoverButton()
	        ...
	}
	Button(action: {
	    withAnimation(."..."()){
	        self.show.toggle()
	    }  
	})
}
```
The second example is very easy to build, but also very easy to be destroyed by HIG


### Step 2

```Swift
struct Ex2ArrowShape: Shape{
    func path(in rect: CGRect) -> Path {
        let center = rect.width / 2
        return Path{ path in
            path.move(to:  CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height-20))
            path.addLine(to: CGPoint(x: center-15, y: rect.height-20))
            path.addLine(to: CGPoint(x: center, y: rect.height-5))
            path.addLine(to: CGPoint(x: center+15, y: rect.height-20))
            path.addLine(to: CGPoint(x: 0, y: rect.height-20))
        }
    }
}
```
Another example of container, this time builded for circle button.

<p align="right">(<a href="#top">back to top</a>)</p>


## Contributing

If you have a suggestion that would make this better, please use contacts below.
Don't forget to give the project a star! Thanks again!

<p align="right">(<a href="#top">back to top</a>)</p>


## Contact

**Discord**:  Roberto D'Anna#5386

**Email**: [roberto.danna97@icloud.com](mailto:roberto.danna97@icloud.com)

**Project Link**: [https://github.com/Koryde/Popover-iPhone-examples](https://github.com/Koryde/Popover-iPhone-examples)

<p align="right">(<a href="#top">back to top</a>)</p>
