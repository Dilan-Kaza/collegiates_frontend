import { Carousel, Timeline, Heading, CWCReps, BlogNews } from "@components";
import { Link } from "react-router";

export default function Home() {
  // TODO: make more flexible to add/remove/change images
  const carouselImages = ["carousel/2025NQ.jpg", "carousel/2025QS.jpg", "carousel/2025GS.jpg", "carousel/2026QS.JPG"];

  return (
    <>
      <div className="relative overflow-hidden">
        <img className="w-full object-center object-fit -z-10" src="/test_img_4.png" />
        <div className="absolute inset-10 flex flex-col items-center justify-center">
          <Heading className="text-xl md:text-8xl animate-fadeIn text-secondary align-middle z-10">
            Welcome to Collegiate Wushu
          </Heading>
        </div>
      </div>
      

      <div className="py-6 bg-primary hidden md:block">
        <Carousel imgs={carouselImages} />
      </div>

      <div className="py-8 bg-off-white px-[10%]">
        <Link to="/news" className="text-2xl font-semibold text-primary mb-4 hover:underline">News</Link>
        <BlogNews />
      </div>

      <div className="py-8 md:py-[12rem] bg-primary text-secondary">
        <Timeline />
      </div>

      <div className="py-8 md:py-[6rem] bg-off-white">
        <CWCReps />
      </div>
    </>
  );
}
